// Mocks generated by Mockito 5.3.2 from annotations
// in ottaa_project_flutter/test/Providers/TTS/ttsprovider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:ui' as _i6;

import 'package:mockito/mockito.dart' as _i1;
import 'package:ottaa_project_flutter/application/providers/tts_provider.dart'
    as _i3;
import 'package:ottaa_project_flutter/core/models/voices_model.dart' as _i5;
import 'package:ottaa_project_flutter/core/repositories/repositories.dart'
    as _i2;

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

class _FakeTTSRepository_0 extends _i1.SmartFake implements _i2.TTSRepository {
  _FakeTTSRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TTSProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockTTSProvider extends _i1.Mock implements _i3.TTSProvider {
  MockTTSProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TTSRepository get tts => (super.noSuchMethod(
        Invocation.getter(#tts),
        returnValue: _FakeTTSRepository_0(
          this,
          Invocation.getter(#tts),
        ),
      ) as _i2.TTSRepository);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  _i4.Future<void> speak(String? text) => (super.noSuchMethod(
        Invocation.method(
          #speak,
          [text],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<List<_i5.Voices>> fetchVoices(String? languageCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchVoices,
          [languageCode],
        ),
        returnValue: _i4.Future<List<_i5.Voices>>.value(<_i5.Voices>[]),
      ) as _i4.Future<List<_i5.Voices>>);
  @override
  _i4.Future<void> changeVoiceSpeed(double? speed) => (super.noSuchMethod(
        Invocation.method(
          #changeVoiceSpeed,
          [speed],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> changeCustomTTs(bool? value) => (super.noSuchMethod(
        Invocation.method(
          #changeCustomTTs,
          [value],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> changeTTSVoice(String? voice) => (super.noSuchMethod(
        Invocation.method(
          #changeTTSVoice,
          [voice],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
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

/// A class which mocks [TTSRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTTSRepository extends _i1.Mock implements _i2.TTSRepository {
  MockTTSRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<void> speak(String? text) => (super.noSuchMethod(
        Invocation.method(
          #speak,
          [text],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<List<_i5.Voices>> fetchVoices() => (super.noSuchMethod(
        Invocation.method(
          #fetchVoices,
          [],
        ),
        returnValue: _i4.Future<List<_i5.Voices>>.value(<_i5.Voices>[]),
      ) as _i4.Future<List<_i5.Voices>>);
  @override
  _i4.Future<void> changeVoiceSpeed(double? speed) => (super.noSuchMethod(
        Invocation.method(
          #changeVoiceSpeed,
          [speed],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> changeCustomTTs(bool? value) => (super.noSuchMethod(
        Invocation.method(
          #changeCustomTTs,
          [value],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> changeTTSVoice(String? voice) => (super.noSuchMethod(
        Invocation.method(
          #changeTTSVoice,
          [voice],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
