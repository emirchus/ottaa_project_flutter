// Mocks generated by Mockito 5.3.2 from annotations
// in ottaa_project_flutter/test/Providers/Auth/auth_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:ui' as _i8;

import 'package:either_dart/either.dart' as _i3;
import 'package:flutter_riverpod/flutter_riverpod.dart' as _i10;
import 'package:mockito/mockito.dart' as _i1;
import 'package:ottaa_project_flutter/application/notifiers/auth_notifier.dart'
    as _i2;
import 'package:ottaa_project_flutter/application/notifiers/loading_notifier.dart'
    as _i9;
import 'package:ottaa_project_flutter/application/notifiers/user_notifier.dart'
    as _i17;
import 'package:ottaa_project_flutter/application/providers/auth_provider.dart'
    as _i5;
import 'package:ottaa_project_flutter/application/service/about_service.dart'
    as _i13;
import 'package:ottaa_project_flutter/application/service/auth_service.dart'
    as _i12;
import 'package:ottaa_project_flutter/core/abstracts/user_model.dart' as _i4;
import 'package:ottaa_project_flutter/core/enums/sign_in_types.dart' as _i7;
import 'package:ottaa_project_flutter/core/enums/user_payment.dart' as _i14;
import 'package:ottaa_project_flutter/core/models/assets_image.dart' as _i15;
import 'package:ottaa_project_flutter/core/repositories/local_database_repository.dart'
    as _i16;
import 'package:state_notifier/state_notifier.dart' as _i11;

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

class _FakeAuthNotifier_0 extends _i1.SmartFake implements _i2.AuthNotifier {
  _FakeAuthNotifier_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserModel_2 extends _i1.SmartFake implements _i4.UserModel {
  _FakeUserModel_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthProvider extends _i1.Mock implements _i5.AuthProvider {
  MockAuthProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AuthNotifier get authData => (super.noSuchMethod(
        Invocation.getter(#authData),
        returnValue: _FakeAuthNotifier_0(
          this,
          Invocation.getter(#authData),
        ),
      ) as _i2.AuthNotifier);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  _i6.Future<void> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<_i3.Either<String, _i4.UserModel>> signIn(
    _i7.SignInType? type, [
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
        returnValue: _i6.Future<_i3.Either<String, _i4.UserModel>>.value(
            _FakeEither_1<String, _i4.UserModel>(
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
      ) as _i6.Future<_i3.Either<String, _i4.UserModel>>);
  @override
  void addListener(_i8.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i8.VoidCallback? listener) => super.noSuchMethod(
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

/// A class which mocks [LoadingNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoadingNotifier extends _i1.Mock implements _i9.LoadingNotifier {
  MockLoadingNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set onError(_i10.ErrorListener? _onError) => super.noSuchMethod(
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
  _i6.Stream<bool> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i6.Stream<bool>.empty(),
      ) as _i6.Stream<bool>);
  @override
  bool get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: false,
      ) as bool);
  @override
  set state(bool? value) => super.noSuchMethod(
        Invocation.setter(
          #state,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get debugState => (super.noSuchMethod(
        Invocation.getter(#debugState),
        returnValue: false,
      ) as bool);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  void showLoading() => super.noSuchMethod(
        Invocation.method(
          #showLoading,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void hideLoading() => super.noSuchMethod(
        Invocation.method(
          #hideLoading,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void toggleLoading() => super.noSuchMethod(
        Invocation.method(
          #toggleLoading,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool getState() => (super.noSuchMethod(
        Invocation.method(
          #getState,
          [],
        ),
        returnValue: false,
      ) as bool);
  @override
  bool updateShouldNotify(
    bool? old,
    bool? current,
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
  _i10.RemoveListener addListener(
    _i11.Listener<bool>? listener, {
    bool? fireImmediately = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
          {#fireImmediately: fireImmediately},
        ),
        returnValue: () {},
      ) as _i10.RemoveListener);
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [AuthService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthService extends _i1.Mock implements _i12.AuthService {
  MockAuthService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get isLogged => (super.noSuchMethod(
        Invocation.getter(#isLogged),
        returnValue: false,
      ) as bool);
  @override
  _i6.Future<_i3.Either<String, _i4.UserModel>> getCurrentUser() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCurrentUser,
          [],
        ),
        returnValue: _i6.Future<_i3.Either<String, _i4.UserModel>>.value(
            _FakeEither_1<String, _i4.UserModel>(
          this,
          Invocation.method(
            #getCurrentUser,
            [],
          ),
        )),
      ) as _i6.Future<_i3.Either<String, _i4.UserModel>>);
  @override
  _i6.Future<String> runToGetDataFromOtherPlatform({
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
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<bool> isLoggedIn() => (super.noSuchMethod(
        Invocation.method(
          #isLoggedIn,
          [],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<void> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<_i3.Either<String, _i4.UserModel>> signIn(
    _i7.SignInType? type, [
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
        returnValue: _i6.Future<_i3.Either<String, _i4.UserModel>>.value(
            _FakeEither_1<String, _i4.UserModel>(
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
      ) as _i6.Future<_i3.Either<String, _i4.UserModel>>);
  @override
  _i6.Future<_i3.Either<String, bool>> signUp() => (super.noSuchMethod(
        Invocation.method(
          #signUp,
          [],
        ),
        returnValue: _i6.Future<_i3.Either<String, bool>>.value(
            _FakeEither_1<String, bool>(
          this,
          Invocation.method(
            #signUp,
            [],
          ),
        )),
      ) as _i6.Future<_i3.Either<String, bool>>);
}

/// A class which mocks [AboutService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAboutService extends _i1.Mock implements _i13.AboutService {
  MockAboutService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<String> getAppVersion() => (super.noSuchMethod(
        Invocation.method(
          #getAppVersion,
          [],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<String> getAvailableAppVersion() => (super.noSuchMethod(
        Invocation.method(
          #getAvailableAppVersion,
          [],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<String> getDeviceName() => (super.noSuchMethod(
        Invocation.method(
          #getDeviceName,
          [],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<String> getEmail() => (super.noSuchMethod(
        Invocation.method(
          #getEmail,
          [],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<_i14.UserPayment> getUserType() => (super.noSuchMethod(
        Invocation.method(
          #getUserType,
          [],
        ),
        returnValue: _i6.Future<_i14.UserPayment>.value(_i14.UserPayment.free),
      ) as _i6.Future<_i14.UserPayment>);
  @override
  _i6.Future<void> sendSupportEmail() => (super.noSuchMethod(
        Invocation.method(
          #sendSupportEmail,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<String> getProfilePicture() => (super.noSuchMethod(
        Invocation.method(
          #getProfilePicture,
          [],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<void> uploadProfilePicture(_i15.AssetsImage? image) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadProfilePicture,
          [image],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<_i3.Either<String, _i4.UserModel>> getUserInformation() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserInformation,
          [],
        ),
        returnValue: _i6.Future<_i3.Either<String, _i4.UserModel>>.value(
            _FakeEither_1<String, _i4.UserModel>(
          this,
          Invocation.method(
            #getUserInformation,
            [],
          ),
        )),
      ) as _i6.Future<_i3.Either<String, _i4.UserModel>>);
  @override
  _i6.Future<void> uploadUserInformation() => (super.noSuchMethod(
        Invocation.method(
          #uploadUserInformation,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<bool> isCurrentUserAvatarExist() => (super.noSuchMethod(
        Invocation.method(
          #isCurrentUserAvatarExist,
          [],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<bool> isFirstTime() => (super.noSuchMethod(
        Invocation.method(
          #isFirstTime,
          [],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
}

/// A class which mocks [LocalDatabaseRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalDatabaseRepository extends _i1.Mock
    implements _i16.LocalDatabaseRepository {
  MockLocalDatabaseRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set user(_i4.UserModel? user) => super.noSuchMethod(
        Invocation.setter(
          #user,
          user,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> setUser(_i4.UserModel? user) => (super.noSuchMethod(
        Invocation.method(
          #setUser,
          [user],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<_i4.UserModel?> getUser() => (super.noSuchMethod(
        Invocation.method(
          #getUser,
          [],
        ),
        returnValue: _i6.Future<_i4.UserModel?>.value(),
      ) as _i6.Future<_i4.UserModel?>);
  @override
  _i6.Future<void> deleteUser() => (super.noSuchMethod(
        Invocation.method(
          #deleteUser,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
}

/// A class which mocks [AuthNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthNotifier extends _i1.Mock implements _i2.AuthNotifier {
  MockAuthNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set onError(_i10.ErrorListener? _onError) => super.noSuchMethod(
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
  _i6.Stream<bool> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i6.Stream<bool>.empty(),
      ) as _i6.Stream<bool>);
  @override
  bool get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: false,
      ) as bool);
  @override
  set state(bool? value) => super.noSuchMethod(
        Invocation.setter(
          #state,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get debugState => (super.noSuchMethod(
        Invocation.getter(#debugState),
        returnValue: false,
      ) as bool);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  void setSignedIn() => super.noSuchMethod(
        Invocation.method(
          #setSignedIn,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setSignedOut() => super.noSuchMethod(
        Invocation.method(
          #setSignedOut,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool updateShouldNotify(
    bool? old,
    bool? current,
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
  _i10.RemoveListener addListener(
    _i11.Listener<bool>? listener, {
    bool? fireImmediately = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
          {#fireImmediately: fireImmediately},
        ),
        returnValue: () {},
      ) as _i10.RemoveListener);
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
class MockUserNotifier extends _i1.Mock implements _i17.UserNotifier {
  MockUserNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.UserModel get user => (super.noSuchMethod(
        Invocation.getter(#user),
        returnValue: _FakeUserModel_2(
          this,
          Invocation.getter(#user),
        ),
      ) as _i4.UserModel);
  @override
  set onError(_i10.ErrorListener? _onError) => super.noSuchMethod(
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
  _i6.Stream<_i4.UserModel?> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i6.Stream<_i4.UserModel?>.empty(),
      ) as _i6.Stream<_i4.UserModel?>);
  @override
  set state(_i4.UserModel? value) => super.noSuchMethod(
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
  void setUser(_i4.UserModel? user) => super.noSuchMethod(
        Invocation.method(
          #setUser,
          [user],
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool updateShouldNotify(
    _i4.UserModel? old,
    _i4.UserModel? current,
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
  _i10.RemoveListener addListener(
    _i11.Listener<_i4.UserModel?>? listener, {
    bool? fireImmediately = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
          {#fireImmediately: fireImmediately},
        ),
        returnValue: () {},
      ) as _i10.RemoveListener);
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
