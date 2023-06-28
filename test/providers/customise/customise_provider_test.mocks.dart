// Mocks generated by Mockito 5.4.0 from annotations
// in ottaa_project_flutter/test/providers/customise/customise_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:ui' as _i2;

import 'package:either_dart/src/either.dart' as _i5;
import 'package:flutter/foundation.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:ottaa_project_flutter/application/common/i18n.dart' as _i3;
import 'package:ottaa_project_flutter/application/language/translation_tree.dart'
    as _i8;
import 'package:ottaa_project_flutter/application/providers/user_provider.dart'
    as _i17;
import 'package:ottaa_project_flutter/core/abstracts/basic_search.dart' as _i15;
import 'package:ottaa_project_flutter/core/abstracts/user_model.dart' as _i10;
import 'package:ottaa_project_flutter/core/models/group_model.dart' as _i12;
import 'package:ottaa_project_flutter/core/models/picto_model.dart' as _i13;
import 'package:ottaa_project_flutter/core/models/shortcuts_model.dart' as _i6;
import 'package:ottaa_project_flutter/core/repositories/customise_repository.dart'
    as _i11;
import 'package:ottaa_project_flutter/core/repositories/groups_repository.dart'
    as _i14;
import 'package:ottaa_project_flutter/core/repositories/local_database_repository.dart'
    as _i9;
import 'package:ottaa_project_flutter/core/repositories/pictograms_repository.dart'
    as _i16;

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

class _FakeLocale_0 extends _i1.SmartFake implements _i2.Locale {
  _FakeLocale_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeI18N_1 extends _i1.SmartFake implements _i3.I18N {
  _FakeI18N_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeValueListenable_2<T> extends _i1.SmartFake
    implements _i4.ValueListenable<T> {
  _FakeValueListenable_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_3<L, R> extends _i1.SmartFake implements _i5.Either<L, R> {
  _FakeEither_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeShortcutsModel_4 extends _i1.SmartFake
    implements _i6.ShortcutsModel {
  _FakeShortcutsModel_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [I18N].
///
/// See the documentation for Mockito's code generation for more information.
class MockI18N extends _i1.Mock implements _i3.I18N {
  MockI18N() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Map<String, _i2.Locale> get platformLanguages => (super.noSuchMethod(
        Invocation.getter(#platformLanguages),
        returnValue: <String, _i2.Locale>{},
      ) as Map<String, _i2.Locale>);
  @override
  _i2.Locale get currentLocale => (super.noSuchMethod(
        Invocation.getter(#currentLocale),
        returnValue: _FakeLocale_0(
          this,
          Invocation.getter(#currentLocale),
        ),
      ) as _i2.Locale);
  @override
  set currentLocale(_i2.Locale? _currentLocale) => super.noSuchMethod(
        Invocation.setter(
          #currentLocale,
          _currentLocale,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  _i7.Future<_i3.I18N> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i7.Future<_i3.I18N>.value(_FakeI18N_1(
          this,
          Invocation.method(
            #init,
            [],
          ),
        )),
      ) as _i7.Future<_i3.I18N>);
  @override
  _i7.Future<_i8.TranslationTree?> loadTranslation(_i2.Locale? locale) =>
      (super.noSuchMethod(
        Invocation.method(
          #loadTranslation,
          [locale],
        ),
        returnValue: _i7.Future<_i8.TranslationTree?>.value(),
      ) as _i7.Future<_i8.TranslationTree?>);
  @override
  _i7.Future<void> changeLanguage(String? languageCode) => (super.noSuchMethod(
        Invocation.method(
          #changeLanguage,
          [languageCode],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> changeLanguageFromLocale(_i2.Locale? locale) =>
      (super.noSuchMethod(
        Invocation.method(
          #changeLanguageFromLocale,
          [locale],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  void notify() => super.noSuchMethod(
        Invocation.method(
          #notify,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addListener(_i2.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i2.VoidCallback? listener) => super.noSuchMethod(
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

/// A class which mocks [LocalDatabaseRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalDatabaseRepository extends _i1.Mock
    implements _i9.LocalDatabaseRepository {
  MockLocalDatabaseRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set user(_i10.UserModel? user) => super.noSuchMethod(
        Invocation.setter(
          #user,
          user,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> setUser(_i10.UserModel? user) => (super.noSuchMethod(
        Invocation.method(
          #setUser,
          [user],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<_i10.UserModel?> getUser() => (super.noSuchMethod(
        Invocation.method(
          #getUser,
          [],
        ),
        returnValue: _i7.Future<_i10.UserModel?>.value(),
      ) as _i7.Future<_i10.UserModel?>);
  @override
  _i7.Future<void> deleteUser() => (super.noSuchMethod(
        Invocation.method(
          #deleteUser,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<bool> getIntro() => (super.noSuchMethod(
        Invocation.method(
          #getIntro,
          [],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
  @override
  _i7.Future<void> setIntro([bool? value]) => (super.noSuchMethod(
        Invocation.method(
          #setIntro,
          [value],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<String> getVoice() => (super.noSuchMethod(
        Invocation.method(
          #getVoice,
          [],
        ),
        returnValue: _i7.Future<String>.value(''),
      ) as _i7.Future<String>);
  @override
  _i7.Future<bool> getLongClick() => (super.noSuchMethod(
        Invocation.method(
          #getLongClick,
          [],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
  @override
  _i7.Future<void> setLongClick({required bool? isLongClick}) =>
      (super.noSuchMethod(
        Invocation.method(
          #setLongClick,
          [],
          {#isLongClick: isLongClick},
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> setVoice({required String? name}) => (super.noSuchMethod(
        Invocation.method(
          #setVoice,
          [],
          {#name: name},
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i4.ValueListenable<dynamic> getListeneableFromName(String? name) =>
      (super.noSuchMethod(
        Invocation.method(
          #getListeneableFromName,
          [name],
        ),
        returnValue: _FakeValueListenable_2<dynamic>(
          this,
          Invocation.method(
            #getListeneableFromName,
            [name],
          ),
        ),
      ) as _i4.ValueListenable<dynamic>);
}

/// A class which mocks [CustomiseRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCustomiseRepository extends _i1.Mock
    implements _i11.CustomiseRepository {
  MockCustomiseRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i5.Either<String, void>> setShortcutsForUser({
    required _i6.ShortcutsModel? shortcuts,
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
        returnValue: _i7.Future<_i5.Either<String, void>>.value(
            _FakeEither_3<String, void>(
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
      ) as _i7.Future<_i5.Either<String, void>>);
  @override
  _i7.Future<List<_i12.Group>> fetchDefaultGroups(
          {required String? languageCode}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchDefaultGroups,
          [],
          {#languageCode: languageCode},
        ),
        returnValue: _i7.Future<List<_i12.Group>>.value(<_i12.Group>[]),
      ) as _i7.Future<List<_i12.Group>>);
  @override
  _i7.Future<List<_i13.Picto>> fetchDefaultPictos(
          {required String? languageCode}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchDefaultPictos,
          [],
          {#languageCode: languageCode},
        ),
        returnValue: _i7.Future<List<_i13.Picto>>.value(<_i13.Picto>[]),
      ) as _i7.Future<List<_i13.Picto>>);
  @override
  _i7.Future<_i6.ShortcutsModel> fetchShortcutsForUser(
          {required String? userId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchShortcutsForUser,
          [],
          {#userId: userId},
        ),
        returnValue: _i7.Future<_i6.ShortcutsModel>.value(_FakeShortcutsModel_4(
          this,
          Invocation.method(
            #fetchShortcutsForUser,
            [],
            {#userId: userId},
          ),
        )),
      ) as _i7.Future<_i6.ShortcutsModel>);
  @override
  _i7.Future<List<_i12.Group>> fetchUserGroups({
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
        returnValue: _i7.Future<List<_i12.Group>>.value(<_i12.Group>[]),
      ) as _i7.Future<List<_i12.Group>>);
  @override
  _i7.Future<List<_i13.Picto>> fetchUserPictos({
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
        returnValue: _i7.Future<List<_i13.Picto>>.value(<_i13.Picto>[]),
      ) as _i7.Future<List<_i13.Picto>>);
  @override
  _i7.Future<bool> valuesExistOrNot({
    required String? languageCode,
    required String? userId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #valuesExistOrNot,
          [],
          {
            #languageCode: languageCode,
            #userId: userId,
          },
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
}

/// A class which mocks [GroupsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockGroupsRepository extends _i1.Mock implements _i14.GroupsRepository {
  MockGroupsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<List<_i12.Group>> getAllGroups({bool? defaultGroups = false}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllGroups,
          [],
          {#defaultGroups: defaultGroups},
        ),
        returnValue: _i7.Future<List<_i12.Group>>.value(<_i12.Group>[]),
      ) as _i7.Future<List<_i12.Group>>);
  @override
  _i7.Future<List<_i12.Group>> getDefaultGroups() => (super.noSuchMethod(
        Invocation.method(
          #getDefaultGroups,
          [],
        ),
        returnValue: _i7.Future<List<_i12.Group>>.value(<_i12.Group>[]),
      ) as _i7.Future<List<_i12.Group>>);
  @override
  _i7.Future<void> uploadGroups(
    List<_i12.Group>? data,
    String? type,
    String? language, {
    String? userId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadGroups,
          [
            data,
            type,
            language,
          ],
          {#userId: userId},
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> updateGroups(
    _i12.Group? data,
    String? type,
    String? language,
    int? index,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateGroups,
          [
            data,
            type,
            language,
            index,
          ],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<List<_i12.Group>> getGroups(_i15.BasicSearch? search) =>
      (super.noSuchMethod(
        Invocation.method(
          #getGroups,
          [search],
        ),
        returnValue: _i7.Future<List<_i12.Group>>.value(<_i12.Group>[]),
      ) as _i7.Future<List<_i12.Group>>);
}

/// A class which mocks [PictogramsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPictogramsRepository extends _i1.Mock
    implements _i16.PictogramsRepository {
  MockPictogramsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<List<_i13.Picto>> getAllPictograms() => (super.noSuchMethod(
        Invocation.method(
          #getAllPictograms,
          [],
        ),
        returnValue: _i7.Future<List<_i13.Picto>>.value(<_i13.Picto>[]),
      ) as _i7.Future<List<_i13.Picto>>);
  @override
  _i7.Future<void> uploadPictograms(
    List<_i13.Picto>? data,
    String? language, {
    String? userId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadPictograms,
          [
            data,
            language,
          ],
          {#userId: userId},
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> updatePictogram(
    _i13.Picto? pictogram,
    String? language,
    int? index,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updatePictogram,
          [
            pictogram,
            language,
            index,
          ],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<List<_i13.Picto>> getPictograms(_i15.BasicSearch? search) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPictograms,
          [search],
        ),
        returnValue: _i7.Future<List<_i13.Picto>>.value(<_i13.Picto>[]),
      ) as _i7.Future<List<_i13.Picto>>);
  @override
  _i7.Future<Map<String, String>> loadTranslations(
          {required String? language}) =>
      (super.noSuchMethod(
        Invocation.method(
          #loadTranslations,
          [],
          {#language: language},
        ),
        returnValue: _i7.Future<Map<String, String>>.value(<String, String>{}),
      ) as _i7.Future<Map<String, String>>);
}

/// A class which mocks [UserNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserNotifier extends _i1.Mock implements _i17.UserNotifier {
  MockUserNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set user(_i10.UserModel? userModel) => super.noSuchMethod(
        Invocation.setter(
          #user,
          userModel,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  void setUser(_i10.UserModel? userModel) => super.noSuchMethod(
        Invocation.method(
          #setUser,
          [userModel],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void clearUser() => super.noSuchMethod(
        Invocation.method(
          #clearUser,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addListener(_i2.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i2.VoidCallback? listener) => super.noSuchMethod(
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
