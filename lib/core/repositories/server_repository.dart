import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:ottaa_project_flutter/core/enums/board_data_type.dart';
import 'package:ottaa_project_flutter/core/enums/user_types.dart';
import 'package:ottaa_project_flutter/core/models/arsaac_data_model.dart';
import 'package:ottaa_project_flutter/core/models/assets_image.dart';
import 'package:ottaa_project_flutter/core/models/devices_token.dart';
import 'package:ottaa_project_flutter/core/models/shortcuts_model.dart';

typedef EitherVoid = Either<String, void>;
typedef EitherString = Either<String, String>;
typedef EitherListMap = Either<String, List<Map<String, dynamic>>>;
typedef EitherMap = Either<String, Map<String, dynamic>>;

abstract class ServerRepository {

  Future<EitherString> getAvailableAppVersion(String platform);

  Future<UserType> getUserType(String userId);

  Future<EitherString> getUserProfilePicture(String userId);

  Future<EitherVoid> uploadUserPicture(String userId, AssetsImage image);

  Future<EitherMap> getUserInformation(String id);

  Future<EitherVoid> uploadUserInformation(String userId, Map<String, dynamic> data);

  Future<List<Map<String, dynamic>>> getUserSentences(String userId, {required String language, required String type, bool isFavorite = false});

  Future<EitherVoid> uploadUserSentences(String userId, String language, String type, List<Map<String, dynamic>> data);

  Future<EitherListMap> getAllPictograms(String userId, String languageCode);

  Future<EitherVoid> uploadPictograms(String userId, String language, {required List<Map<String, dynamic>> data});

  Future<EitherVoid> updatePictogram(String userId, String language, int index, {required Map<String, dynamic> data});

  Future<EitherListMap> getAllGroups(String userId, String languageCode);

  Future<EitherVoid> uploadGroups(String userId, String language, {required List<Map<String, dynamic>> data});

  Future<EitherVoid> updateGroup(String userId, String language, int index, {required Map<String, dynamic> data});

  Future<EitherMap> getPictogramsStatistics(String userId, String languageCode, [CancelToken? cancelToken]);

  Future<EitherMap> getMostUsedSentences(String userId, String languageCode, [CancelToken? cancelToken]);

  Future<EitherString> generatePhraseGPT({required String prompt, required int maxTokens, double temperature = 0});

  Future<String> uploadUserImage({required String path, required String name, required String userId});

  Future<void> updateUserSettings({required Map<String, dynamic> data, required String userId});

  Future<EitherMap> getConnectedUsers({required String userId});

  Future<EitherMap> fetchConnectedUserData({required String userId});

  Future<void> removeCurrentUser({required String userId, required String careGiverId});

  Future<EitherVoid> setShortcutsForUser({required ShortcutsModel shortcuts, required String userId});

  Future<void> updateUserData({required Map<String, dynamic> data, required String userId});

  Future<EitherMap> getEmailToken(String ownEmail, String email, [CancelToken? cancelToken]);

  Future<EitherMap> verifyEmailToken(String ownEmail, String email, String token, [CancelToken? cancelToken]);

  Future<EitherMap> getProfileById({required String id});

  Future<dynamic> getDefaultGroups(String languageCode);

  Future<dynamic> getDefaultPictos(String languageCode);

  Future<void> updateUserType({required String id, required UserType userType});

  Future<EitherMap> fetchShortcutsForUser({required String userId});

  Future<Map<String, dynamic>?> createPictoGroupData({
    required String userId,
    required String language,
    required BoardDataType type,
    required Map<String, dynamic> data,
    CancelToken? cancelToken,
  });

  Future<void> updateDevicesId({required String userId, required DeviceToken deviceToken});

  Future<EitherMap> learnPictograms({
    required String uid,
    required String language,
    required String model,
    required List<Map<String, dynamic>> tokens,
    CancelToken? cancelToken,
  });

  Future<EitherMap> predictPictogram({
    required String sentence,
    required String uid,
    required String language,
    required String model,
    required List<String> groups,
    required Map<String, List<String>> tags,
    bool reduced = false,
    int limit = 10,
    int chunk = 4,
    CancelToken? cancelToken,
  });

  Future<EitherVoid> updateUserLastConnectionTime({required String userId, required int time});

  Future<dynamic> fetchUserGroups({required String languageCode, required String userId});

  Future<dynamic> fetchUserPictos({required String languageCode, required String userId});

  Future<void> updateLanguageSettings({required Map<String, dynamic> map, required String userId});

  Future<void> updateVoiceAndSubtitleSettings({required Map<String, dynamic> map, required String userId});

  Future<void> updateAccessibilitySettings({required Map<String, dynamic> map, required String userId});

  Future<void> updateMainSettings({required Map<String, dynamic> map, required String userId});

  Future<dynamic> fetchUserSettings({required String userId});

  Future<Either<String, List<ArsaacDataModel>>> fetchPhotosFromGlobalSymbols({required String searchText, required String languageCode});

  Future<String> uploadOtherImages({required String imagePath, required String directoryPath, required String name, required String userId});
}
