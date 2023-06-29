// Mocks generated by Mockito 5.4.0 from annotations
// in ottaa_project_flutter/test/service/groups/groups_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:typed_data' as _i8;

import 'package:dio/dio.dart' as _i12;
import 'package:either_dart/either.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:ottaa_project_flutter/core/abstracts/user_model.dart' as _i5;
import 'package:ottaa_project_flutter/core/enums/board_data_type.dart' as _i14;
import 'package:ottaa_project_flutter/core/enums/sign_in_types.dart' as _i6;
import 'package:ottaa_project_flutter/core/enums/user_types.dart' as _i10;
import 'package:ottaa_project_flutter/core/models/assets_image.dart' as _i11;
import 'package:ottaa_project_flutter/core/models/devices_token.dart' as _i15;
import 'package:ottaa_project_flutter/core/models/shortcuts_model.dart' as _i13;
import 'package:ottaa_project_flutter/core/repositories/auth_repository.dart'
    as _i3;
import 'package:ottaa_project_flutter/core/repositories/remote_storage_repository.dart'
    as _i7;
import 'package:ottaa_project_flutter/core/repositories/server_repository.dart'
    as _i9;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i3.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get isLogged => (super.noSuchMethod(
        Invocation.getter(#isLogged),
        returnValue: false,
      ) as bool);
  @override
  _i4.Future<_i2.Either<String, _i5.UserModel>> signIn(
    _i6.SignInType? type, [
    String? email,
    String? password,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #signIn,
          [
            type,
            email,
            password,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<String, _i5.UserModel>>.value(
            _FakeEither_0<String, _i5.UserModel>(
          this,
          Invocation.method(
            #signIn,
            [
              type,
              email,
              password,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<String, _i5.UserModel>>);
  @override
  _i4.Future<_i2.Either<String, bool>> signUp() => (super.noSuchMethod(
        Invocation.method(
          #signUp,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<String, bool>>.value(
            _FakeEither_0<String, bool>(
          this,
          Invocation.method(
            #signUp,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<String, bool>>);
  @override
  _i4.Future<_i2.Either<String, _i5.UserModel>> getCurrentUser() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCurrentUser,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<String, _i5.UserModel>>.value(
            _FakeEither_0<String, _i5.UserModel>(
          this,
          Invocation.method(
            #getCurrentUser,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<String, _i5.UserModel>>);
  @override
  _i4.Future<bool> isLoggedIn() => (super.noSuchMethod(
        Invocation.method(
          #isLoggedIn,
          [],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<void> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<String> getDeviceId() => (super.noSuchMethod(
        Invocation.method(
          #getDeviceId,
          [],
        ),
        returnValue: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);
}

/// A class which mocks [RemoteStorageRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoteStorageRepository extends _i1.Mock
    implements _i7.RemoteStorageRepository {
  MockRemoteStorageRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<String> uploadFile(
    String? path,
    String? fileName,
    _i8.Uint8List? file,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadFile,
          [
            path,
            fileName,
            file,
          ],
        ),
        returnValue: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);
  @override
  _i4.Future<void> deleteFile(
    String? path,
    String? fileName,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteFile,
          [
            path,
            fileName,
          ],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<String> readRemoteFile({
    required String? path,
    required String? fileName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readRemoteFile,
          [],
          {
            #path: path,
            #fileName: fileName,
          },
        ),
        returnValue: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);
}

/// A class which mocks [ServerRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockServerRepository extends _i1.Mock implements _i9.ServerRepository {
  MockServerRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<String, String>> getAvailableAppVersion(
          String? platform) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAvailableAppVersion,
          [platform],
        ),
        returnValue: _i4.Future<_i2.Either<String, String>>.value(
            _FakeEither_0<String, String>(
          this,
          Invocation.method(
            #getAvailableAppVersion,
            [platform],
          ),
        )),
      ) as _i4.Future<_i2.Either<String, String>>);
  @override
  _i4.Future<_i10.UserType> getUserType(String? userId) => (super.noSuchMethod(
        Invocation.method(
          #getUserType,
          [userId],
        ),
        returnValue: _i4.Future<_i10.UserType>.value(_i10.UserType.caregiver),
      ) as _i4.Future<_i10.UserType>);
  @override
  _i4.Future<_i2.Either<String, String>> getUserProfilePicture(
          String? userId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserProfilePicture,
          [userId],
        ),
        returnValue: _i4.Future<_i2.Either<String, String>>.value(
            _FakeEither_0<String, String>(
          this,
          Invocation.method(
            #getUserProfilePicture,
            [userId],
          ),
        )),
      ) as _i4.Future<_i2.Either<String, String>>);
  @override
  _i4.Future<_i2.Either<String, void>> uploadUserPicture(
    String? userId,
    _i11.AssetsImage? image,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadUserPicture,
          [
            userId,
            image,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<String, void>>.value(
            _FakeEither_0<String, void>(
          this,
          Invocation.method(
            #uploadUserPicture,
            [
              userId,
              image,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<String, void>>);
  @override
  _i4.Future<_i2.Either<String, Map<String, dynamic>>> getUserInformation(
          String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserInformation,
          [id],
        ),
        returnValue: _i4.Future<_i2.Either<String, Map<String, dynamic>>>.value(
            _FakeEither_0<String, Map<String, dynamic>>(
          this,
          Invocation.method(
            #getUserInformation,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.Either<String, Map<String, dynamic>>>);
  @override
  _i4.Future<_i2.Either<String, void>> uploadUserInformation(
    String? userId,
    Map<String, dynamic>? data,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadUserInformation,
          [
            userId,
            data,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<String, void>>.value(
            _FakeEither_0<String, void>(
          this,
          Invocation.method(
            #uploadUserInformation,
            [
              userId,
              data,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<String, void>>);
  @override
  _i4.Future<List<Map<String, dynamic>>> getUserSentences(
    String? userId, {
    required String? language,
    required String? type,
    bool? isFavorite = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserSentences,
          [userId],
          {
            #language: language,
            #type: type,
            #isFavorite: isFavorite,
          },
        ),
        returnValue: _i4.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i4.Future<List<Map<String, dynamic>>>);
  @override
  _i4.Future<_i2.Either<String, void>> uploadUserSentences(
    String? userId,
    String? language,
    String? type,
    List<Map<String, dynamic>>? data,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadUserSentences,
          [
            userId,
            language,
            type,
            data,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<String, void>>.value(
            _FakeEither_0<String, void>(
          this,
          Invocation.method(
            #uploadUserSentences,
            [
              userId,
              language,
              type,
              data,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<String, void>>);
  @override
  _i4.Future<_i2.Either<String, List<Map<String, dynamic>>>> getAllPictograms(
    String? userId,
    String? languageCode,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllPictograms,
          [
            userId,
            languageCode,
          ],
        ),
        returnValue:
            _i4.Future<_i2.Either<String, List<Map<String, dynamic>>>>.value(
                _FakeEither_0<String, List<Map<String, dynamic>>>(
          this,
          Invocation.method(
            #getAllPictograms,
            [
              userId,
              languageCode,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<String, List<Map<String, dynamic>>>>);
  @override
  _i4.Future<_i2.Either<String, void>> uploadPictograms(
    String? userId,
    String? language, {
    required List<Map<String, dynamic>>? data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadPictograms,
          [
            userId,
            language,
          ],
          {#data: data},
        ),
        returnValue: _i4.Future<_i2.Either<String, void>>.value(
            _FakeEither_0<String, void>(
          this,
          Invocation.method(
            #uploadPictograms,
            [
              userId,
              language,
            ],
            {#data: data},
          ),
        )),
      ) as _i4.Future<_i2.Either<String, void>>);
  @override
  _i4.Future<_i2.Either<String, void>> updatePictogram(
    String? userId,
    String? language,
    int? index, {
    required Map<String, dynamic>? data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updatePictogram,
          [
            userId,
            language,
            index,
          ],
          {#data: data},
        ),
        returnValue: _i4.Future<_i2.Either<String, void>>.value(
            _FakeEither_0<String, void>(
          this,
          Invocation.method(
            #updatePictogram,
            [
              userId,
              language,
              index,
            ],
            {#data: data},
          ),
        )),
      ) as _i4.Future<_i2.Either<String, void>>);
  @override
  _i4.Future<_i2.Either<String, List<Map<String, dynamic>>>> getAllGroups(
    String? userId,
    String? languageCode,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllGroups,
          [
            userId,
            languageCode,
          ],
        ),
        returnValue:
            _i4.Future<_i2.Either<String, List<Map<String, dynamic>>>>.value(
                _FakeEither_0<String, List<Map<String, dynamic>>>(
          this,
          Invocation.method(
            #getAllGroups,
            [
              userId,
              languageCode,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<String, List<Map<String, dynamic>>>>);
  @override
  _i4.Future<_i2.Either<String, void>> uploadGroups(
    String? userId,
    String? language, {
    required List<Map<String, dynamic>>? data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadGroups,
          [
            userId,
            language,
          ],
          {#data: data},
        ),
        returnValue: _i4.Future<_i2.Either<String, void>>.value(
            _FakeEither_0<String, void>(
          this,
          Invocation.method(
            #uploadGroups,
            [
              userId,
              language,
            ],
            {#data: data},
          ),
        )),
      ) as _i4.Future<_i2.Either<String, void>>);
  @override
  _i4.Future<_i2.Either<String, void>> updateGroup(
    String? userId,
    String? language,
    int? index, {
    required Map<String, dynamic>? data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateGroup,
          [
            userId,
            language,
            index,
          ],
          {#data: data},
        ),
        returnValue: _i4.Future<_i2.Either<String, void>>.value(
            _FakeEither_0<String, void>(
          this,
          Invocation.method(
            #updateGroup,
            [
              userId,
              language,
              index,
            ],
            {#data: data},
          ),
        )),
      ) as _i4.Future<_i2.Either<String, void>>);
  @override
  _i4.Future<_i2.Either<String, Map<String, dynamic>>> getPictogramsStatistics(
    String? userId,
    String? languageCode, [
    _i12.CancelToken? cancelToken,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPictogramsStatistics,
          [
            userId,
            languageCode,
            cancelToken,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<String, Map<String, dynamic>>>.value(
            _FakeEither_0<String, Map<String, dynamic>>(
          this,
          Invocation.method(
            #getPictogramsStatistics,
            [
              userId,
              languageCode,
              cancelToken,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<String, Map<String, dynamic>>>);
  @override
  _i4.Future<_i2.Either<String, Map<String, dynamic>>> getMostUsedSentences(
    String? userId,
    String? languageCode, [
    _i12.CancelToken? cancelToken,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMostUsedSentences,
          [
            userId,
            languageCode,
            cancelToken,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<String, Map<String, dynamic>>>.value(
            _FakeEither_0<String, Map<String, dynamic>>(
          this,
          Invocation.method(
            #getMostUsedSentences,
            [
              userId,
              languageCode,
              cancelToken,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<String, Map<String, dynamic>>>);
  @override
  _i4.Future<_i2.Either<String, String>> generatePhraseGPT({
    required String? prompt,
    required int? maxTokens,
    double? temperature = 0.0,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #generatePhraseGPT,
          [],
          {
            #prompt: prompt,
            #maxTokens: maxTokens,
            #temperature: temperature,
          },
        ),
        returnValue: _i4.Future<_i2.Either<String, String>>.value(
            _FakeEither_0<String, String>(
          this,
          Invocation.method(
            #generatePhraseGPT,
            [],
            {
              #prompt: prompt,
              #maxTokens: maxTokens,
              #temperature: temperature,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<String, String>>);
  @override
  _i4.Future<String> uploadUserImage({
    required String? path,
    required String? name,
    required String? userId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadUserImage,
          [],
          {
            #path: path,
            #name: name,
            #userId: userId,
          },
        ),
        returnValue: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);
  @override
  _i4.Future<void> updateUserSettings({
    required Map<String, dynamic>? data,
    required String? userId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateUserSettings,
          [],
          {
            #data: data,
            #userId: userId,
          },
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<_i2.Either<String, Map<String, dynamic>>> getConnectedUsers(
          {required String? userId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getConnectedUsers,
          [],
          {#userId: userId},
        ),
        returnValue: _i4.Future<_i2.Either<String, Map<String, dynamic>>>.value(
            _FakeEither_0<String, Map<String, dynamic>>(
          this,
          Invocation.method(
            #getConnectedUsers,
            [],
            {#userId: userId},
          ),
        )),
      ) as _i4.Future<_i2.Either<String, Map<String, dynamic>>>);
  @override
  _i4.Future<_i2.Either<String, Map<String, dynamic>>> fetchConnectedUserData(
          {required String? userId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchConnectedUserData,
          [],
          {#userId: userId},
        ),
        returnValue: _i4.Future<_i2.Either<String, Map<String, dynamic>>>.value(
            _FakeEither_0<String, Map<String, dynamic>>(
          this,
          Invocation.method(
            #fetchConnectedUserData,
            [],
            {#userId: userId},
          ),
        )),
      ) as _i4.Future<_i2.Either<String, Map<String, dynamic>>>);
  @override
  _i4.Future<void> removeCurrentUser({
    required String? userId,
    required String? careGiverId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeCurrentUser,
          [],
          {
            #userId: userId,
            #careGiverId: careGiverId,
          },
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<_i2.Either<String, void>> setShortcutsForUser({
    required _i13.ShortcutsModel? shortcuts,
    required String? userId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #setShortcutsForUser,
          [],
          {
            #shortcuts: shortcuts,
            #userId: userId,
          },
        ),
        returnValue: _i4.Future<_i2.Either<String, void>>.value(
            _FakeEither_0<String, void>(
          this,
          Invocation.method(
            #setShortcutsForUser,
            [],
            {
              #shortcuts: shortcuts,
              #userId: userId,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<String, void>>);
  @override
  _i4.Future<void> updateUserData({
    required Map<String, dynamic>? data,
    required String? userId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateUserData,
          [],
          {
            #data: data,
            #userId: userId,
          },
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<_i2.Either<String, Map<String, dynamic>>> getEmailToken(
    String? ownEmail,
    String? email, [
    _i12.CancelToken? cancelToken,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #getEmailToken,
          [
            ownEmail,
            email,
            cancelToken,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<String, Map<String, dynamic>>>.value(
            _FakeEither_0<String, Map<String, dynamic>>(
          this,
          Invocation.method(
            #getEmailToken,
            [
              ownEmail,
              email,
              cancelToken,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<String, Map<String, dynamic>>>);
  @override
  _i4.Future<_i2.Either<String, Map<String, dynamic>>> verifyEmailToken(
    String? ownEmail,
    String? email,
    String? token, [
    _i12.CancelToken? cancelToken,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #verifyEmailToken,
          [
            ownEmail,
            email,
            token,
            cancelToken,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<String, Map<String, dynamic>>>.value(
            _FakeEither_0<String, Map<String, dynamic>>(
          this,
          Invocation.method(
            #verifyEmailToken,
            [
              ownEmail,
              email,
              token,
              cancelToken,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<String, Map<String, dynamic>>>);
  @override
  _i4.Future<_i2.Either<String, Map<String, dynamic>>> getProfileById(
          {required String? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProfileById,
          [],
          {#id: id},
        ),
        returnValue: _i4.Future<_i2.Either<String, Map<String, dynamic>>>.value(
            _FakeEither_0<String, Map<String, dynamic>>(
          this,
          Invocation.method(
            #getProfileById,
            [],
            {#id: id},
          ),
        )),
      ) as _i4.Future<_i2.Either<String, Map<String, dynamic>>>);
  @override
  _i4.Future<dynamic> getDefaultGroups(String? languageCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDefaultGroups,
          [languageCode],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> getDefaultPictos(String? languageCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDefaultPictos,
          [languageCode],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<void> updateUserType({
    required String? id,
    required _i10.UserType? userType,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateUserType,
          [],
          {
            #id: id,
            #userType: userType,
          },
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<_i2.Either<String, Map<String, dynamic>>> fetchShortcutsForUser(
          {required String? userId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchShortcutsForUser,
          [],
          {#userId: userId},
        ),
        returnValue: _i4.Future<_i2.Either<String, Map<String, dynamic>>>.value(
            _FakeEither_0<String, Map<String, dynamic>>(
          this,
          Invocation.method(
            #fetchShortcutsForUser,
            [],
            {#userId: userId},
          ),
        )),
      ) as _i4.Future<_i2.Either<String, Map<String, dynamic>>>);
  @override
  _i4.Future<Map<String, dynamic>?> createPictoGroupData({
    required String? userId,
    required String? language,
    required _i14.BoardDataType? type,
    required Map<String, dynamic>? data,
    _i12.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #createPictoGroupData,
          [],
          {
            #userId: userId,
            #language: language,
            #type: type,
            #data: data,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i4.Future<Map<String, dynamic>?>.value(),
      ) as _i4.Future<Map<String, dynamic>?>);
  @override
  _i4.Future<void> updateDevicesId({
    required String? userId,
    required _i15.DeviceToken? deviceToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateDevicesId,
          [],
          {
            #userId: userId,
            #deviceToken: deviceToken,
          },
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<_i2.Either<String, Map<String, dynamic>>> learnPictograms({
    required String? uid,
    required String? language,
    required String? model,
    required List<Map<String, dynamic>>? tokens,
    _i12.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #learnPictograms,
          [],
          {
            #uid: uid,
            #language: language,
            #model: model,
            #tokens: tokens,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i4.Future<_i2.Either<String, Map<String, dynamic>>>.value(
            _FakeEither_0<String, Map<String, dynamic>>(
          this,
          Invocation.method(
            #learnPictograms,
            [],
            {
              #uid: uid,
              #language: language,
              #model: model,
              #tokens: tokens,
              #cancelToken: cancelToken,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<String, Map<String, dynamic>>>);
  @override
  _i4.Future<_i2.Either<String, Map<String, dynamic>>> predictPictogram({
    required String? sentence,
    required String? uid,
    required String? language,
    required String? model,
    required List<String>? groups,
    required Map<String, List<String>>? tags,
    bool? reduced = false,
    int? limit = 10,
    int? chunk = 4,
    _i12.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #predictPictogram,
          [],
          {
            #sentence: sentence,
            #uid: uid,
            #language: language,
            #model: model,
            #groups: groups,
            #tags: tags,
            #reduced: reduced,
            #limit: limit,
            #chunk: chunk,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i4.Future<_i2.Either<String, Map<String, dynamic>>>.value(
            _FakeEither_0<String, Map<String, dynamic>>(
          this,
          Invocation.method(
            #predictPictogram,
            [],
            {
              #sentence: sentence,
              #uid: uid,
              #language: language,
              #model: model,
              #groups: groups,
              #tags: tags,
              #reduced: reduced,
              #limit: limit,
              #chunk: chunk,
              #cancelToken: cancelToken,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<String, Map<String, dynamic>>>);
  @override
  _i4.Future<_i2.Either<String, void>> updateUserLastConnectionTime({
    required String? userId,
    required int? time,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateUserLastConnectionTime,
          [],
          {
            #userId: userId,
            #time: time,
          },
        ),
        returnValue: _i4.Future<_i2.Either<String, void>>.value(
            _FakeEither_0<String, void>(
          this,
          Invocation.method(
            #updateUserLastConnectionTime,
            [],
            {
              #userId: userId,
              #time: time,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<String, void>>);
  @override
  _i4.Future<dynamic> fetchUserGroups({
    required String? languageCode,
    required String? userId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchUserGroups,
          [],
          {
            #languageCode: languageCode,
            #userId: userId,
          },
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> fetchUserPictos({
    required String? languageCode,
    required String? userId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchUserPictos,
          [],
          {
            #languageCode: languageCode,
            #userId: userId,
          },
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<void> updateLanguageSettings({
    required Map<String, dynamic>? map,
    required String? userId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateLanguageSettings,
          [],
          {
            #map: map,
            #userId: userId,
          },
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> updateVoiceAndSubtitleSettings({
    required Map<String, dynamic>? map,
    required String? userId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateVoiceAndSubtitleSettings,
          [],
          {
            #map: map,
            #userId: userId,
          },
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> updateAccessibilitySettings({
    required Map<String, dynamic>? map,
    required String? userId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateAccessibilitySettings,
          [],
          {
            #map: map,
            #userId: userId,
          },
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> updateMainSettings({
    required Map<String, dynamic>? map,
    required String? userId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateMainSettings,
          [],
          {
            #map: map,
            #userId: userId,
          },
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<dynamic> fetchUserSettings({required String? userId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchUserSettings,
          [],
          {#userId: userId},
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
}