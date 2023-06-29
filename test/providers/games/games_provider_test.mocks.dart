// Mocks generated by Mockito 5.4.0 from annotations
// in ottaa_project_flutter/test/providers/games/games_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flutter_riverpod/flutter_riverpod.dart' as _i10;
import 'package:mockito/mockito.dart' as _i1;
import 'package:ottaa_project_flutter/application/notifiers/patient_notifier.dart'
    as _i9;
import 'package:ottaa_project_flutter/core/abstracts/basic_search.dart' as _i6;
import 'package:ottaa_project_flutter/core/models/group_model.dart' as _i8;
import 'package:ottaa_project_flutter/core/models/patient_user_model.dart'
    as _i2;
import 'package:ottaa_project_flutter/core/models/picto_model.dart' as _i5;
import 'package:ottaa_project_flutter/core/repositories/groups_repository.dart'
    as _i7;
import 'package:ottaa_project_flutter/core/repositories/pictograms_repository.dart'
    as _i3;
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

class _FakePatientUserModel_0 extends _i1.SmartFake
    implements _i2.PatientUserModel {
  _FakePatientUserModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PictogramsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPictogramsRepository extends _i1.Mock
    implements _i3.PictogramsRepository {
  MockPictogramsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i5.Picto>> getAllPictograms() => (super.noSuchMethod(
        Invocation.method(
          #getAllPictograms,
          [],
        ),
        returnValue: _i4.Future<List<_i5.Picto>>.value(<_i5.Picto>[]),
      ) as _i4.Future<List<_i5.Picto>>);
  @override
  _i4.Future<void> uploadPictograms(
    List<_i5.Picto>? data,
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
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> updatePictogram(
    _i5.Picto? pictogram,
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
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<List<_i5.Picto>> getPictograms(_i6.BasicSearch? search) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPictograms,
          [search],
        ),
        returnValue: _i4.Future<List<_i5.Picto>>.value(<_i5.Picto>[]),
      ) as _i4.Future<List<_i5.Picto>>);
  @override
  _i4.Future<Map<String, String>> loadTranslations(
          {required String? language}) =>
      (super.noSuchMethod(
        Invocation.method(
          #loadTranslations,
          [],
          {#language: language},
        ),
        returnValue: _i4.Future<Map<String, String>>.value(<String, String>{}),
      ) as _i4.Future<Map<String, String>>);
}

/// A class which mocks [GroupsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockGroupsRepository extends _i1.Mock implements _i7.GroupsRepository {
  MockGroupsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i8.Group>> getAllGroups({bool? defaultGroups = false}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllGroups,
          [],
          {#defaultGroups: defaultGroups},
        ),
        returnValue: _i4.Future<List<_i8.Group>>.value(<_i8.Group>[]),
      ) as _i4.Future<List<_i8.Group>>);
  @override
  _i4.Future<List<_i8.Group>> getDefaultGroups() => (super.noSuchMethod(
        Invocation.method(
          #getDefaultGroups,
          [],
        ),
        returnValue: _i4.Future<List<_i8.Group>>.value(<_i8.Group>[]),
      ) as _i4.Future<List<_i8.Group>>);
  @override
  _i4.Future<void> uploadGroups(
    List<_i8.Group>? data,
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
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> updateGroups(
    _i8.Group? data,
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
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<List<_i8.Group>> getGroups(_i6.BasicSearch? search) =>
      (super.noSuchMethod(
        Invocation.method(
          #getGroups,
          [search],
        ),
        returnValue: _i4.Future<List<_i8.Group>>.value(<_i8.Group>[]),
      ) as _i4.Future<List<_i8.Group>>);
}

/// A class which mocks [PatientNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockPatientNotifier extends _i1.Mock implements _i9.PatientNotifier {
  MockPatientNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.PatientUserModel get user => (super.noSuchMethod(
        Invocation.getter(#user),
        returnValue: _FakePatientUserModel_0(
          this,
          Invocation.getter(#user),
        ),
      ) as _i2.PatientUserModel);
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
  _i4.Stream<_i2.PatientUserModel?> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i4.Stream<_i2.PatientUserModel?>.empty(),
      ) as _i4.Stream<_i2.PatientUserModel?>);
  @override
  set state(_i2.PatientUserModel? value) => super.noSuchMethod(
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
  void setUser(_i2.PatientUserModel? user) => super.noSuchMethod(
        Invocation.method(
          #setUser,
          [user],
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool updateShouldNotify(
    _i2.PatientUserModel? old,
    _i2.PatientUserModel? current,
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
    _i11.Listener<_i2.PatientUserModel?>? listener, {
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