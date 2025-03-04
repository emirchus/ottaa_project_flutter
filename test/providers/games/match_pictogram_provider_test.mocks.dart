// Mocks generated by Mockito 5.4.0 from annotations
// in ottaa_project_flutter/test/providers/games/match_pictogram_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:ui' as _i9;

import 'package:flutter/widgets.dart' as _i3;
import 'package:just_audio/just_audio.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:ottaa_project_flutter/application/notifiers/patient_notifier.dart'
    as _i6;
import 'package:ottaa_project_flutter/application/providers/games_provider.dart'
    as _i10;
import 'package:ottaa_project_flutter/application/providers/tts_provider.dart'
    as _i7;
import 'package:ottaa_project_flutter/core/models/group_model.dart' as _i12;
import 'package:ottaa_project_flutter/core/models/picto_model.dart' as _i11;
import 'package:ottaa_project_flutter/core/models/voices_model.dart' as _i8;
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

class _FakePageController_1 extends _i1.SmartFake
    implements _i3.PageController {
  _FakePageController_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeScrollController_2 extends _i1.SmartFake
    implements _i3.ScrollController {
  _FakeScrollController_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTimer_3 extends _i1.SmartFake implements _i4.Timer {
  _FakeTimer_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAudioPlayer_4 extends _i1.SmartFake implements _i5.AudioPlayer {
  _FakeAudioPlayer_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePatientNotifier_5 extends _i1.SmartFake
    implements _i6.PatientNotifier {
  _FakePatientNotifier_5(
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
class MockTTSProvider extends _i1.Mock implements _i7.TTSProvider {
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
  set speakOperation(_i4.Future<void>? _speakOperation) => super.noSuchMethod(
        Invocation.setter(
          #speakOperation,
          _speakOperation,
        ),
        returnValueForMissingStub: null,
      );
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
  _i4.Future<List<_i8.Voices>> fetchVoices(String? languageCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchVoices,
          [languageCode],
        ),
        returnValue: _i4.Future<List<_i8.Voices>>.value(<_i8.Voices>[]),
      ) as _i4.Future<List<_i8.Voices>>);
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
  _i4.Future<void> ttsStop() => (super.noSuchMethod(
        Invocation.method(
          #ttsStop,
          [],
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
  void addListener(_i9.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i9.VoidCallback? listener) => super.noSuchMethod(
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

/// A class which mocks [GamesProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockGamesProvider extends _i1.Mock implements _i10.GamesProvider {
  @override
  int get numberOfGroups => (super.noSuchMethod(
        Invocation.getter(#numberOfGroups),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set numberOfGroups(int? _numberOfGroups) => super.noSuchMethod(
        Invocation.setter(
          #numberOfGroups,
          _numberOfGroups,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get completedGroups => (super.noSuchMethod(
        Invocation.getter(#completedGroups),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set completedGroups(int? _completedGroups) => super.noSuchMethod(
        Invocation.setter(
          #completedGroups,
          _completedGroups,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get activeGroups => (super.noSuchMethod(
        Invocation.getter(#activeGroups),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set activeGroups(int? _activeGroups) => super.noSuchMethod(
        Invocation.setter(
          #activeGroups,
          _activeGroups,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get selectedGame => (super.noSuchMethod(
        Invocation.getter(#selectedGame),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set selectedGame(int? _selectedGame) => super.noSuchMethod(
        Invocation.setter(
          #selectedGame,
          _selectedGame,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String get selectedGroupName => (super.noSuchMethod(
        Invocation.getter(#selectedGroupName),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  set selectedGroupName(String? _selectedGroupName) => super.noSuchMethod(
        Invocation.setter(
          #selectedGroupName,
          _selectedGroupName,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.PageController get mainPageController => (super.noSuchMethod(
        Invocation.getter(#mainPageController),
        returnValue: _FakePageController_1(
          this,
          Invocation.getter(#mainPageController),
        ),
        returnValueForMissingStub: _FakePageController_1(
          this,
          Invocation.getter(#mainPageController),
        ),
      ) as _i3.PageController);
  @override
  _i3.ScrollController get gridScrollController => (super.noSuchMethod(
        Invocation.getter(#gridScrollController),
        returnValue: _FakeScrollController_2(
          this,
          Invocation.getter(#gridScrollController),
        ),
        returnValueForMissingStub: _FakeScrollController_2(
          this,
          Invocation.getter(#gridScrollController),
        ),
      ) as _i3.ScrollController);
  @override
  set gridScrollController(_i3.ScrollController? _gridScrollController) =>
      super.noSuchMethod(
        Invocation.setter(
          #gridScrollController,
          _gridScrollController,
        ),
        returnValueForMissingStub: null,
      );
  @override
  Map<String, _i11.Picto> get pictograms => (super.noSuchMethod(
        Invocation.getter(#pictograms),
        returnValue: <String, _i11.Picto>{},
        returnValueForMissingStub: <String, _i11.Picto>{},
      ) as Map<String, _i11.Picto>);
  @override
  set pictograms(Map<String, _i11.Picto>? _pictograms) => super.noSuchMethod(
        Invocation.setter(
          #pictograms,
          _pictograms,
        ),
        returnValueForMissingStub: null,
      );
  @override
  Map<String, _i12.Group> get groups => (super.noSuchMethod(
        Invocation.getter(#groups),
        returnValue: <String, _i12.Group>{},
        returnValueForMissingStub: <String, _i12.Group>{},
      ) as Map<String, _i12.Group>);
  @override
  set groups(Map<String, _i12.Group>? _groups) => super.noSuchMethod(
        Invocation.setter(
          #groups,
          _groups,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get correctScore => (super.noSuchMethod(
        Invocation.getter(#correctScore),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set correctScore(int? _correctScore) => super.noSuchMethod(
        Invocation.setter(
          #correctScore,
          _correctScore,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get incorrectScore => (super.noSuchMethod(
        Invocation.getter(#incorrectScore),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set incorrectScore(int? _incorrectScore) => super.noSuchMethod(
        Invocation.setter(
          #incorrectScore,
          _incorrectScore,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<_i11.Picto> get selectedPicts => (super.noSuchMethod(
        Invocation.getter(#selectedPicts),
        returnValue: <_i11.Picto>[],
        returnValueForMissingStub: <_i11.Picto>[],
      ) as List<_i11.Picto>);
  @override
  set selectedPicts(List<_i11.Picto>? _selectedPicts) => super.noSuchMethod(
        Invocation.setter(
          #selectedPicts,
          _selectedPicts,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get useTime => (super.noSuchMethod(
        Invocation.getter(#useTime),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set useTime(int? _useTime) => super.noSuchMethod(
        Invocation.setter(
          #useTime,
          _useTime,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get streak => (super.noSuchMethod(
        Invocation.getter(#streak),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set streak(int? _streak) => super.noSuchMethod(
        Invocation.setter(
          #streak,
          _streak,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<bool> get matchPictoTop => (super.noSuchMethod(
        Invocation.getter(#matchPictoTop),
        returnValue: <bool>[],
        returnValueForMissingStub: <bool>[],
      ) as List<bool>);
  @override
  set matchPictoTop(List<bool>? _matchPictoTop) => super.noSuchMethod(
        Invocation.setter(
          #matchPictoTop,
          _matchPictoTop,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<bool> get matchPictoBottom => (super.noSuchMethod(
        Invocation.getter(#matchPictoBottom),
        returnValue: <bool>[],
        returnValueForMissingStub: <bool>[],
      ) as List<bool>);
  @override
  set matchPictoBottom(List<bool>? _matchPictoBottom) => super.noSuchMethod(
        Invocation.setter(
          #matchPictoBottom,
          _matchPictoBottom,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get isMute => (super.noSuchMethod(
        Invocation.getter(#isMute),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  set isMute(bool? _isMute) => super.noSuchMethod(
        Invocation.setter(
          #isMute,
          _isMute,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<_i11.Picto> get gamePictsWTP => (super.noSuchMethod(
        Invocation.getter(#gamePictsWTP),
        returnValue: <_i11.Picto>[],
        returnValueForMissingStub: <_i11.Picto>[],
      ) as List<_i11.Picto>);
  @override
  set gamePictsWTP(List<_i11.Picto>? _gamePictsWTP) => super.noSuchMethod(
        Invocation.setter(
          #gamePictsWTP,
          _gamePictsWTP,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<_i11.Picto> get gamePictsMP => (super.noSuchMethod(
        Invocation.getter(#gamePictsMP),
        returnValue: <_i11.Picto>[],
        returnValueForMissingStub: <_i11.Picto>[],
      ) as List<_i11.Picto>);
  @override
  set gamePictsMP(List<_i11.Picto>? _gamePictsMP) => super.noSuchMethod(
        Invocation.setter(
          #gamePictsMP,
          _gamePictsMP,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get correctPictoWTP => (super.noSuchMethod(
        Invocation.getter(#correctPictoWTP),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set correctPictoWTP(int? _correctPictoWTP) => super.noSuchMethod(
        Invocation.setter(
          #correctPictoWTP,
          _correctPictoWTP,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get hintsBtn => (super.noSuchMethod(
        Invocation.getter(#hintsBtn),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  set hintsBtn(bool? _hintsBtn) => super.noSuchMethod(
        Invocation.setter(
          #hintsBtn,
          _hintsBtn,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Timer get hintTimer1 => (super.noSuchMethod(
        Invocation.getter(#hintTimer1),
        returnValue: _FakeTimer_3(
          this,
          Invocation.getter(#hintTimer1),
        ),
        returnValueForMissingStub: _FakeTimer_3(
          this,
          Invocation.getter(#hintTimer1),
        ),
      ) as _i4.Timer);
  @override
  set hintTimer1(_i4.Timer? _hintTimer1) => super.noSuchMethod(
        Invocation.setter(
          #hintTimer1,
          _hintTimer1,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Timer get hintTimer2 => (super.noSuchMethod(
        Invocation.getter(#hintTimer2),
        returnValue: _FakeTimer_3(
          this,
          Invocation.getter(#hintTimer2),
        ),
        returnValueForMissingStub: _FakeTimer_3(
          this,
          Invocation.getter(#hintTimer2),
        ),
      ) as _i4.Timer);
  @override
  set hintTimer2(_i4.Timer? _hintTimer2) => super.noSuchMethod(
        Invocation.setter(
          #hintTimer2,
          _hintTimer2,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Timer get gameTimer => (super.noSuchMethod(
        Invocation.getter(#gameTimer),
        returnValue: _FakeTimer_3(
          this,
          Invocation.getter(#gameTimer),
        ),
        returnValueForMissingStub: _FakeTimer_3(
          this,
          Invocation.getter(#gameTimer),
        ),
      ) as _i4.Timer);
  @override
  set gameTimer(_i4.Timer? _gameTimer) => super.noSuchMethod(
        Invocation.setter(
          #gameTimer,
          _gameTimer,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get hintsEnabled => (super.noSuchMethod(
        Invocation.getter(#hintsEnabled),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  set hintsEnabled(bool? _hintsEnabled) => super.noSuchMethod(
        Invocation.setter(
          #hintsEnabled,
          _hintsEnabled,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get difficultyLevel => (super.noSuchMethod(
        Invocation.getter(#difficultyLevel),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set difficultyLevel(int? _difficultyLevel) => super.noSuchMethod(
        Invocation.setter(
          #difficultyLevel,
          _difficultyLevel,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.AudioPlayer get backgroundMusicPlayer => (super.noSuchMethod(
        Invocation.getter(#backgroundMusicPlayer),
        returnValue: _FakeAudioPlayer_4(
          this,
          Invocation.getter(#backgroundMusicPlayer),
        ),
        returnValueForMissingStub: _FakeAudioPlayer_4(
          this,
          Invocation.getter(#backgroundMusicPlayer),
        ),
      ) as _i5.AudioPlayer);
  @override
  set backgroundMusicPlayer(_i5.AudioPlayer? _backgroundMusicPlayer) =>
      super.noSuchMethod(
        Invocation.setter(
          #backgroundMusicPlayer,
          _backgroundMusicPlayer,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.AudioPlayer get clicksPlayer => (super.noSuchMethod(
        Invocation.getter(#clicksPlayer),
        returnValue: _FakeAudioPlayer_4(
          this,
          Invocation.getter(#clicksPlayer),
        ),
        returnValueForMissingStub: _FakeAudioPlayer_4(
          this,
          Invocation.getter(#clicksPlayer),
        ),
      ) as _i5.AudioPlayer);
  @override
  set clicksPlayer(_i5.AudioPlayer? _clicksPlayer) => super.noSuchMethod(
        Invocation.setter(
          #clicksPlayer,
          _clicksPlayer,
        ),
        returnValueForMissingStub: null,
      );
  @override
  Map<int, _i11.Picto> get bottomPositionsMP => (super.noSuchMethod(
        Invocation.getter(#bottomPositionsMP),
        returnValue: <int, _i11.Picto>{},
        returnValueForMissingStub: <int, _i11.Picto>{},
      ) as Map<int, _i11.Picto>);
  @override
  set bottomPositionsMP(Map<int, _i11.Picto>? _bottomPositionsMP) =>
      super.noSuchMethod(
        Invocation.setter(
          #bottomPositionsMP,
          _bottomPositionsMP,
        ),
        returnValueForMissingStub: null,
      );
  @override
  Map<int, _i11.Picto> get topPositionsMP => (super.noSuchMethod(
        Invocation.getter(#topPositionsMP),
        returnValue: <int, _i11.Picto>{},
        returnValueForMissingStub: <int, _i11.Picto>{},
      ) as Map<int, _i11.Picto>);
  @override
  set topPositionsMP(Map<int, _i11.Picto>? _topPositionsMP) =>
      super.noSuchMethod(
        Invocation.setter(
          #topPositionsMP,
          _topPositionsMP,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.PatientNotifier get patientState => (super.noSuchMethod(
        Invocation.getter(#patientState),
        returnValue: _FakePatientNotifier_5(
          this,
          Invocation.getter(#patientState),
        ),
        returnValueForMissingStub: _FakePatientNotifier_5(
          this,
          Invocation.getter(#patientState),
        ),
      ) as _i6.PatientNotifier);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i4.Future<void> createRandomForGameWTP() => (super.noSuchMethod(
        Invocation.method(
          #createRandomForGameWTP,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> createRandomForGameMP() => (super.noSuchMethod(
        Invocation.method(
          #createRandomForGameMP,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> fetchSelectedPictos() => (super.noSuchMethod(
        Invocation.method(
          #fetchSelectedPictos,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  void moveForward() => super.noSuchMethod(
        Invocation.method(
          #moveForward,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void moveBackward() => super.noSuchMethod(
        Invocation.method(
          #moveBackward,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void scrollUp() => super.noSuchMethod(
        Invocation.method(
          #scrollUp,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void scrollDown() => super.noSuchMethod(
        Invocation.method(
          #scrollDown,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<void> fetchPictograms() => (super.noSuchMethod(
        Invocation.method(
          #fetchPictograms,
          [],
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
  _i4.Future<void> showHints() => (super.noSuchMethod(
        Invocation.method(
          #showHints,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> cancelHints() => (super.noSuchMethod(
        Invocation.method(
          #cancelHints,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  void notify() => super.noSuchMethod(
        Invocation.method(
          #notify,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<void> playClickSounds({required String? assetName}) =>
      (super.noSuchMethod(
        Invocation.method(
          #playClickSounds,
          [],
          {#assetName: assetName},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> changeMusic({required bool? mute}) => (super.noSuchMethod(
        Invocation.method(
          #changeMusic,
          [],
          {#mute: mute},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> initializeBackgroundMusic() => (super.noSuchMethod(
        Invocation.method(
          #initializeBackgroundMusic,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addListener(_i9.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i9.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
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
