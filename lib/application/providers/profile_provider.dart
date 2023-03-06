import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ottaa_project_flutter/application/common/extensions/user_extension.dart';
import 'package:ottaa_project_flutter/application/notifiers/user_notifier.dart';
import 'package:ottaa_project_flutter/core/abstracts/user_model.dart';
import 'package:ottaa_project_flutter/core/enums/user_types.dart';
import 'package:ottaa_project_flutter/core/models/base_user_model.dart';
import 'package:ottaa_project_flutter/core/models/caregiver_user_model.dart';
import 'package:ottaa_project_flutter/core/models/patient_user_model.dart';
import 'package:ottaa_project_flutter/core/repositories/about_repository.dart';
import 'package:ottaa_project_flutter/core/repositories/auth_repository.dart';
import 'package:ottaa_project_flutter/core/repositories/local_database_repository.dart';
import 'package:ottaa_project_flutter/core/repositories/pictograms_repository.dart';
import 'package:ottaa_project_flutter/core/repositories/profile_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileNotifier extends ChangeNotifier {
  final PictogramsRepository _pictogramsService;
  final ProfileRepository _profileService;
  final AboutRepository _aboutService;
  final AuthRepository _auth;
  final LocalDatabaseRepository _localDatabaseRepository;
  final UserNotifier _userNotifier;

  ProfileNotifier(
    this._pictogramsService,
    this._auth,
    this._profileService,
    this._localDatabaseRepository,
    this._userNotifier,
    this._aboutService,
  );

  bool isCaregiver = false;
  bool isUser = false;

  bool imageSelected = false;
  XFile? profileEditImage;
  late String imageUrl;
  final ImagePicker _picker = ImagePicker();
  bool isLinkAccountOpen = false;
  bool connectedUsersFetched = false;
  List<bool> connectedUsersProfileDataExpanded = [];
  final TextEditingController profileEditNameController = TextEditingController();
  final TextEditingController profileEditSurnameController = TextEditingController();
  final TextEditingController profileEditEmailController = TextEditingController();

  //profile chooser screen
  bool professionalSelected = false;
  bool userSelected = false;

  //profile edit screen
  int day = 0, month = 0, year = 0;
  String yearForDropDown = "0";

  //connected users screen
  List<PatientUserModel> connectedUsersData = [];

  List<bool> expasionList = [];
  bool dataFetched = false;

  //profile email send
  String currentOTTAAInstalled = '';
  String deviceName = '';

  void notify() {
    notifyListeners();
  }

  Future<void> setDate() async {
    final date = _userNotifier.user.settings.data.birthDate;
    day = date.day;
    month = date.month;
    year = date.year;
    notifyListeners();
  }

  Future<void> openDialer() async {
    Uri callUrl = Uri.parse('tel:=+5493518102353');
    if (await canLaunchUrl(callUrl)) {
      await launchUrl(callUrl);
    } else {
      throw 'Could not open the dialler.';
    }
  }

  int convertDate() {
    final date = DateTime(year, month, day);
    return date.millisecondsSinceEpoch;
  }

  Future<void> settingUpUserType() async {
    final user = _userNotifier.user;

    UserModel? newUser;

    if (isCaregiver) {
      newUser = CaregiverUserModel.fromMap({
        ...user.toMap(),
        "type": UserType.caregiver.name,
        "email": user.email,
      });
    } else if (isUser) {
      newUser = PatientUserModel.fromMap({
        ...user.toMap(),
        "type": UserType.user.name,
        "email": user.email,
      });
    } else {
      if (user is CaregiverUserModel) {
        isCaregiver = true;
      } else if (user is PatientUserModel) {
        isUser = true;
      }
    }

    //Update the user type at the realtime database
    await _aboutService.updateUserType(id: user.id, userType: (newUser ?? user).type);
    if (newUser != null) await _profileService.updateUser(data: newUser.toMap(), userId: user.id);

    await _localDatabaseRepository.setUser(newUser ?? user);
    _userNotifier.setUser(newUser ?? user);

    notifyListeners();
  }

  Future<void> updateChanges() async {
    final user = _userNotifier.user;
    if (imageSelected) {
      /// upload the image and fetch its url
      imageUrl = await _profileService.uploadUserImage(
        name: user.settings.data.name,
        path: profileEditImage!.path,
        userId: user.id,
      );
    }

    /// create the data for the upload
    final birthdate = convertDate();

    user.settings.data = user.settings.data.copyWith(
      name: profileEditNameController.text,
      birthDate: DateTime.fromMillisecondsSinceEpoch(birthdate),
      lastName: profileEditSurnameController.text,
      avatar: imageSelected
          ? user.settings.data.avatar.copyWith(
              network: imageUrl,
            )
          : user.settings.data.avatar,
    );

    await _profileService.updateUserSettings(data: user.settings.data.toMap(), userId: user.id);

    await _localDatabaseRepository.setUser(user);
    _userNotifier.setUser(user);

    notifyListeners();
  }

  Future<void> pickImage({required bool cameraOrGallery}) async {
    //todo: can be improved for later
    if (cameraOrGallery) {
      profileEditImage = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1800,
        maxHeight: 1800,
      );
    } else {
      profileEditImage = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
      );
    }
    if (profileEditImage != null) {
      imageSelected = true;
      notify();
    }
  }

  Future<void> fetchConnectedUsersData() async {
    connectedUsersData = [];
    final connectedUsers = await _profileService.getConnectedUsers(userId: _userNotifier.user.id);
    if (connectedUsers.isLeft) return;

    await Future.wait(connectedUsers.right.keys.map((e) async {
      final res = await _profileService.fetchConnectedUserData(userId: e);
      if (res.isRight) {
        final json = res.right;

        connectedUsersData.add(
          PatientUserModel.fromMap(json),
        );
        connectedUsersProfileDataExpanded.add(false);
      }
    }));

    dataFetched = true;
    connectedUsersFetched = true;
    notifyListeners();
  }

  Future<void> fetchUserById(String id) async {
    final userFetch = await _profileService.getProfileById(id: id);

    if (userFetch.isLeft) return;

    final userData = userFetch.right;

    int currentIndex = connectedUsersData.indexWhere((element) => element.id == id);


    connectedUsersData[currentIndex] = PatientUserModel.fromMap(userData);
  }

  Future<void> removeCurrentUser({required String userId, required String careGiverId}) async {
    await _profileService.removeCurrentUser(userId: userId, careGiverId: careGiverId);

    // update the whole list again
    dataFetched = false;
    _userNotifier.user.caregiver.users.removeWhere((key, value) => key == userId);
    _localDatabaseRepository.setUser(_userNotifier.user);
    await fetchConnectedUsersData();
    dataFetched = true;
    notify();
  }
}

final profileProvider = ChangeNotifierProvider<ProfileNotifier>((ref) {
  final pictogramService = GetIt.I<PictogramsRepository>();
  final AuthRepository authService = GetIt.I.get<AuthRepository>();
  final ProfileRepository profileService = GetIt.I.get<ProfileRepository>();
  final LocalDatabaseRepository localDatabaseRepository = GetIt.I.get<LocalDatabaseRepository>();
  final userNot = ref.read(userNotifier.notifier);

  final AboutRepository aboutRepository = GetIt.I.get<AboutRepository>();
  return ProfileNotifier(
    pictogramService,
    authService,
    profileService,
    localDatabaseRepository,
    userNot,
    aboutRepository,
  );
});