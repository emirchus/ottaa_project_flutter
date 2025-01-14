import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:ottaa_project_flutter/application/providers/user_provider.dart';
import 'package:ottaa_project_flutter/core/repositories/about_repository.dart';
import 'package:ottaa_project_flutter/core/repositories/auth_repository.dart';
import 'package:ottaa_project_flutter/core/repositories/local_database_repository.dart';

class SplashProvider extends ChangeNotifier {
  final AboutRepository _aboutRepository;
  final AuthRepository _auth;
  final UserNotifier _userNotifier;
  final LocalDatabaseRepository _hiveRepository;

  SplashProvider(
    this._aboutRepository,
    this._auth,
    this._userNotifier,
    this._hiveRepository,
  );

  Future<bool> checkUserAvatar() => _aboutRepository.isCurrentUserAvatarExist();

  Future<bool> isFirstTime() async {
    return await _hiveRepository.getIntro();
  }

  Future<void> setFirstTime() async {
    await _hiveRepository.setIntro(false);
  }

  Future<bool> fetchUserInformation() async {
    final result = await _aboutRepository.getUserInformation();
    // print(result);
    if (result.isLeft) {
      await _auth.logout();
      return false;
    }
    // _avatarNotifier.changeAvatar(int.tryParse(result.right.settings.data.avatar.asset) ?? 615);
    _userNotifier.setUser(result.right);
    return result.isRight;
  }

  Future<void> updateLastConnectionTime({
    required String userId,
    required int time,
  }) async {
    await _aboutRepository.updateUserLastConnectionTime(
      userId: userId,
      time: time,
    );
  }

  Future<bool> hasUser() async {
    final result = await _auth.getCurrentUser();
    if (result.isLeft) {
      return false;
    }
    return true;
  }
}

final splashProvider = ChangeNotifierProvider<SplashProvider>((ref) {
  final AboutRepository aboutService = GetIt.I.get<AboutRepository>();
  final AuthRepository authService = GetIt.I.get<AuthRepository>();
  final LocalDatabaseRepository localDatabaseRepository = GetIt.I.get<LocalDatabaseRepository>();
  final UserNotifier userState = ref.read(userProvider);
  return SplashProvider(
    aboutService,
    authService,
    userState,
    localDatabaseRepository,
  );
});
