// Mocks generated by Mockito 5.3.2 from annotations
// in ottaa_project_flutter/test/Providers/Splash/SplashProvider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:ui' as _i6;

import 'package:either_dart/either.dart' as _i2;
import 'package:flutter_riverpod/flutter_riverpod.dart' as _i14;
import 'package:mockito/mockito.dart' as _i1;
import 'package:ottaa_project_flutter/application/notifiers/user_avatar_notifier.dart'
    as _i13;
import 'package:ottaa_project_flutter/application/notifiers/user_notifier.dart'
    as _i16;
import 'package:ottaa_project_flutter/application/providers/splash_provider.dart'
    as _i4;
import 'package:ottaa_project_flutter/core/abstracts/user_model.dart' as _i3;
import 'package:ottaa_project_flutter/core/enums/sign_in_types.dart' as _i12;
import 'package:ottaa_project_flutter/core/enums/user_payment.dart' as _i8;
import 'package:ottaa_project_flutter/core/enums/user_types.dart' as _i10;
import 'package:ottaa_project_flutter/core/models/assets_image.dart' as _i9;
import 'package:ottaa_project_flutter/core/repositories/about_repository.dart'
    as _i7;
import 'package:ottaa_project_flutter/core/repositories/auth_repository.dart'
    as _i11;
import 'package:state_notifier/state_notifier.dart' as _i15;

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

class _FakeUserModel_1 extends _i1.SmartFake implements _i3.UserModel {
  _FakeUserModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SplashProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockSplashProvider extends _i1.Mock implements _i4.SplashProvider {
  MockSplashProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  _i5.Future<bool> checkUserAvatar() => (super.noSuchMethod(
        Invocation.method(
          #checkUserAvatar,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<bool> isFirstTime() => (super.noSuchMethod(
        Invocation.method(
          #isFirstTime,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<void> setFirstTime() => (super.noSuchMethod(
        Invocation.method(
          #setFirstTime,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<bool> fetchUserInformation() => (super.noSuchMethod(
        Invocation.method(
          #fetchUserInformation,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<void> updateLastConnectionTime({
    required String? userId,
    required int? time,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateLastConnectionTime,
          [],
          {
            #userId: userId,
            #time: time,
          },
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  void addListener(_i6.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i6.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [AboutRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAboutRepository extends _i1.Mock implements _i7.AboutRepository {
  MockAboutRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<String> getEmail() => (super.noSuchMethod(
        Invocation.method(
          #getEmail,
          [],
        ),
        returnValue: _i5.Future<String>.value(''),
      ) as _i5.Future<String>);
  @override
  _i5.Future<String> getAppVersion() => (super.noSuchMethod(
        Invocation.method(
          #getAppVersion,
          [],
        ),
        returnValue: _i5.Future<String>.value(''),
      ) as _i5.Future<String>);
  @override
  _i5.Future<String> getDeviceName() => (super.noSuchMethod(
        Invocation.method(
          #getDeviceName,
          [],
        ),
        returnValue: _i5.Future<String>.value(''),
      ) as _i5.Future<String>);
  @override
  _i5.Future<_i8.UserPayment> getUserType() => (super.noSuchMethod(
        Invocation.method(
          #getUserType,
          [],
        ),
        returnValue: _i5.Future<_i8.UserPayment>.value(_i8.UserPayment.free),
      ) as _i5.Future<_i8.UserPayment>);
  @override
  _i5.Future<String> getAvailableAppVersion() => (super.noSuchMethod(
        Invocation.method(
          #getAvailableAppVersion,
          [],
        ),
        returnValue: _i5.Future<String>.value(''),
      ) as _i5.Future<String>);
  @override
  _i5.Future<void> sendSupportEmail() => (super.noSuchMethod(
        Invocation.method(
          #sendSupportEmail,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> uploadUserInformation() => (super.noSuchMethod(
        Invocation.method(
          #uploadUserInformation,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> uploadProfilePicture(_i9.AssetsImage? image) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadProfilePicture,
          [image],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<String> getProfilePicture() => (super.noSuchMethod(
        Invocation.method(
          #getProfilePicture,
          [],
        ),
        returnValue: _i5.Future<String>.value(''),
      ) as _i5.Future<String>);
  @override
  _i5.Future<bool> isCurrentUserAvatarExist() => (super.noSuchMethod(
        Invocation.method(
          #isCurrentUserAvatarExist,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<bool> isFirstTime() => (super.noSuchMethod(
        Invocation.method(
          #isFirstTime,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<_i2.Either<String, _i3.UserModel>> getUserInformation() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserInformation,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<String, _i3.UserModel>>.value(
            _FakeEither_0<String, _i3.UserModel>(
          this,
          Invocation.method(
            #getUserInformation,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<String, _i3.UserModel>>);
  @override
  _i5.Future<void> updateUserType({
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
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> updateUserLastConnectionTime({
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
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i11.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get isLogged => (super.noSuchMethod(
        Invocation.getter(#isLogged),
        returnValue: false,
      ) as bool);
  @override
  _i5.Future<_i2.Either<String, _i3.UserModel>> signIn(
    _i12.SignInType? type, [
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
        returnValue: _i5.Future<_i2.Either<String, _i3.UserModel>>.value(
            _FakeEither_0<String, _i3.UserModel>(
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
      ) as _i5.Future<_i2.Either<String, _i3.UserModel>>);
  @override
  _i5.Future<_i2.Either<String, bool>> signUp() => (super.noSuchMethod(
        Invocation.method(
          #signUp,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<String, bool>>.value(
            _FakeEither_0<String, bool>(
          this,
          Invocation.method(
            #signUp,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<String, bool>>);
  @override
  _i5.Future<_i2.Either<String, _i3.UserModel>> getCurrentUser() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCurrentUser,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<String, _i3.UserModel>>.value(
            _FakeEither_0<String, _i3.UserModel>(
          this,
          Invocation.method(
            #getCurrentUser,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<String, _i3.UserModel>>);
  @override
  _i5.Future<bool> isLoggedIn() => (super.noSuchMethod(
        Invocation.method(
          #isLoggedIn,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<void> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<String> runToGetDataFromOtherPlatform({
    required String? email,
    required String? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #runToGetDataFromOtherPlatform,
          [],
          {
            #email: email,
            #id: id,
          },
        ),
        returnValue: _i5.Future<String>.value(''),
      ) as _i5.Future<String>);
  @override
  _i5.Future<String> getDeviceId() => (super.noSuchMethod(
        Invocation.method(
          #getDeviceId,
          [],
        ),
        returnValue: _i5.Future<String>.value(''),
      ) as _i5.Future<String>);
}

/// A class which mocks [UserAvatarNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserAvatarNotifier extends _i1.Mock
    implements _i13.UserAvatarNotifier {
  MockUserAvatarNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set onError(_i14.ErrorListener? _onError) => super.noSuchMethod(
        Invocation.setter(
          #onError,
          _onError,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get mounted => (super.noSuchMethod(
        Invocation.getter(#mounted),
        returnValue: false,
      ) as bool);
  @override
  _i5.Stream<int> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i5.Stream<int>.empty(),
      ) as _i5.Stream<int>);
  @override
  int get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: 0,
      ) as int);
  @override
  set state(int? value) => super.noSuchMethod(
        Invocation.setter(
          #state,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get debugState => (super.noSuchMethod(
        Invocation.getter(#debugState),
        returnValue: 0,
      ) as int);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  void changeAvatar(int? imageId) => super.noSuchMethod(
        Invocation.method(
          #changeAvatar,
          [imageId],
        ),
        returnValueForMissingStub: null,
      );
  @override
  String getAvatar() => (super.noSuchMethod(
        Invocation.method(
          #getAvatar,
          [],
        ),
        returnValue: '',
      ) as String);
  @override
  bool updateShouldNotify(
    int? old,
    int? current,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateShouldNotify,
          [
            old,
            current,
          ],
        ),
        returnValue: false,
      ) as bool);
  @override
  _i14.RemoveListener addListener(
    _i15.Listener<int>? listener, {
    bool? fireImmediately = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
          {#fireImmediately: fireImmediately},
        ),
        returnValue: () {},
      ) as _i14.RemoveListener);
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [UserNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserNotifier extends _i1.Mock implements _i16.UserNotifier {
  MockUserNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.UserModel get user => (super.noSuchMethod(
        Invocation.getter(#user),
        returnValue: _FakeUserModel_1(
          this,
          Invocation.getter(#user),
        ),
      ) as _i3.UserModel);
  @override
  set onError(_i14.ErrorListener? _onError) => super.noSuchMethod(
        Invocation.setter(
          #onError,
          _onError,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get mounted => (super.noSuchMethod(
        Invocation.getter(#mounted),
        returnValue: false,
      ) as bool);
  @override
  _i5.Stream<_i3.UserModel?> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i5.Stream<_i3.UserModel?>.empty(),
      ) as _i5.Stream<_i3.UserModel?>);
  @override
  set state(_i3.UserModel? value) => super.noSuchMethod(
        Invocation.setter(
          #state,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  void setUser(_i3.UserModel? user) => super.noSuchMethod(
        Invocation.method(
          #setUser,
          [user],
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool updateShouldNotify(
    _i3.UserModel? old,
    _i3.UserModel? current,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateShouldNotify,
          [
            old,
            current,
          ],
        ),
        returnValue: false,
      ) as bool);
  @override
  _i14.RemoveListener addListener(
    _i15.Listener<_i3.UserModel?>? listener, {
    bool? fireImmediately = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
          {#fireImmediately: fireImmediately},
        ),
        returnValue: () {},
      ) as _i14.RemoveListener);
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
