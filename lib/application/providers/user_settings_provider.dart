import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:ottaa_project_flutter/application/common/extensions/translate_string.dart';
import 'package:ottaa_project_flutter/application/common/extensions/user_extension.dart';
import 'package:ottaa_project_flutter/application/common/i18n.dart';
import 'package:ottaa_project_flutter/application/notifiers/patient_notifier.dart';
import 'package:ottaa_project_flutter/application/providers/profile_provider.dart';
import 'package:ottaa_project_flutter/application/providers/tts_provider.dart';
import 'package:ottaa_project_flutter/application/providers/user_provider.dart';
import 'package:ottaa_project_flutter/core/enums/devices_accessibility.dart';
import 'package:ottaa_project_flutter/core/enums/display_types.dart';
import 'package:ottaa_project_flutter/core/enums/size_types.dart';
import 'package:ottaa_project_flutter/core/enums/sweep_modes.dart';
import 'package:ottaa_project_flutter/core/enums/velocity_types.dart';
import 'package:ottaa_project_flutter/core/models/accessibility_setting.dart';
import 'package:ottaa_project_flutter/core/models/language_setting.dart';
import 'package:ottaa_project_flutter/core/models/layout_setting.dart';
import 'package:ottaa_project_flutter/core/models/patient_user_model.dart';
import 'package:ottaa_project_flutter/core/models/tts_setting.dart';
import 'package:ottaa_project_flutter/core/models/voices_model.dart';
import 'package:ottaa_project_flutter/core/repositories/repositories.dart';
import 'package:ottaa_project_flutter/core/repositories/user_settings_repository.dart';

class UserSettingsProvider extends ChangeNotifier {
  final I18N _i18n;

  final UserSettingRepository _userSettingRepository;
  final TTSRepository _ttsServices;
  final TTSProvider _ttsProvider;

  final UserNotifier _userNotifier;
  final PatientNotifier _patientNotifier;

  final LocalDatabaseRepository _localDatabaseRepository;

  final ProfileNotifier _profileNotifier;

  UserSettingsProvider(
    this._i18n,
    this._userSettingRepository,
    this._userNotifier,
    this._patientNotifier,
    this._localDatabaseRepository,
    this._profileNotifier,
    this._ttsServices,
    this._ttsProvider,
  );

  bool deleteText = true;
  bool shortcut = true;
  List<bool> selectedShortcuts = [true, true, true, true, true, true, true];
  DisplayTypes boardView = DisplayTypes.grid;
  bool ottaaLabs = false;
  bool accessibility = true;
  double sliderValue = 1.0;
  DevicesAccessibility selectedAccessibility = DevicesAccessibility.press;
  SweepModes selectionType = SweepModes.elements;
  VelocityTypes accessibilitySpeed = VelocityTypes.mid;
  String voiceType = 'default1';
  String voiceRate = VelocityTypes.mid.name;
  bool mute = false;
  bool show = false;
  SizeTypes size = SizeTypes.small;
  bool capital = true;
  String language = 'es_AR';
  late AccessibilitySetting accessibilitySetting;
  late LanguageSetting languageSetting;
  late LayoutSetting layoutSetting;
  late TTSSetting ttsSetting;
  List<Voices> voices = [];
  List<Voices> filteredVoices = [];
  String voiceName = "es-ES-language";

  PatientUserModel get currentUser => _patientNotifier.patient ?? _userNotifier.user!.patient;

  void notify() {
    notifyListeners();
  }

  Future<dynamic> fetchUserSettings() async {
    return await _userSettingRepository.fetchUserSettings(userId: currentUser.id);
  }

  Future<void> init() async {
    language = _i18n.currentLanguage!.locale.toString();
    await fetchAllVoices();
    await initialiseSettings();
  }

  Future<void> initialiseSettings() async {
    final res = await fetchUserSettings();
    if (res.isRight) {
      final data = res.right;
      accessibilitySetting = data['accessibility'] != null ? AccessibilitySetting.fromJson(jsonEncode(data['accessibility'])) : AccessibilitySetting.empty();
      languageSetting = data['language'] != null && data['language'].runtimeType != String ? LanguageSetting.fromJson(jsonEncode(data['language'])) : LanguageSetting.empty(language: data['language']);
      ttsSetting = data['tts'] != null
          ? TTSSetting.fromJson(jsonEncode(data['tts']))
          : TTSSetting.empty(
              language: languageSetting.language,
            );
      layoutSetting = data['layout'] != null ? LayoutSetting.fromJson((jsonEncode(data['layout']))) : LayoutSetting.empty();

      // if (ttsSetting.voiceSetting.voicesSpeed[language]!.name != null) {
      //   voiceRate = ttsSetting.voiceSetting.voicesSpeed[language]!.name;
      // }
    } else {
      accessibilitySetting = AccessibilitySetting.empty();
      languageSetting = LanguageSetting.empty();
      layoutSetting = LayoutSetting.empty();
      ttsSetting = TTSSetting.empty();
    }

    notify();
  }

  Future<void> changeLanguage({required String languageCode}) async {
    language = languageCode;
    languageSetting.language = languageCode;
    if (_userNotifier.user?.isPatient ?? false) {
      await _i18n.changeLanguage(languageCode);
    }
    await fetchAllVoices();
    await changeLanguageWithoutTTSSPeaking(name: filteredVoices.first.name);
    notifyListeners();
  }

  Future<void> changeLanguageWithoutTTSSPeaking({required String name}) async {
    voiceType = name;
    voiceName = name;
    await _ttsServices.changeCustomTTs(true);
    await _ttsServices.changeTTSVoice(name);
    ttsSetting.voiceSetting.voicesNames[language] = name;
    _localDatabaseRepository.setVoice(name: name);
    notifyListeners();
  }

  Future<void> changeOttaaLabs({required bool value}) async {
    ottaaLabs = value;
    languageSetting.labs = value;
    notifyListeners();
  }

  Future<void> updateLanguageSettings() async {
    _userSettingRepository.updateLanguageSettings(
      map: languageSetting.toMap(),
      userId: currentUser.id,
    );

    if (_userNotifier.user!.isCaregiver) {
      int patientIndex = _profileNotifier.connectedUsersData.indexWhere((element) => element.id == _patientNotifier.user.id);

      if (patientIndex != -1) {
        _profileNotifier.connectedUsersData[patientIndex].patientSettings.language = languageSetting;
      }
    } else {
      currentUser.patientSettings.language = languageSetting;

      _localDatabaseRepository.setUser(currentUser);
    }
  }

  Future<void> updateVoiceAndSubtitleSettings() async {
    _userSettingRepository.updateVoiceAndSubtitleSettings(
      map: ttsSetting.toMap(),
      userId: currentUser.id,
    );

    if (_userNotifier.user!.isCaregiver) {
      int patientIndex = _profileNotifier.connectedUsersData.indexWhere((element) => element.id == _patientNotifier.user.id);

      if (patientIndex != -1) {
        _profileNotifier.connectedUsersData[patientIndex].patientSettings.tts = ttsSetting;
      }
    } else {
      currentUser.patientSettings.tts = ttsSetting;

      _localDatabaseRepository.setUser(currentUser);
    }
  }

  Future<void> updateAccessibilitySettings() async {
    _userSettingRepository.updateAccessibilitySettings(
      map: accessibilitySetting.toMap(),
      userId: currentUser.id,
    );

    if (_userNotifier.user!.isCaregiver) {
      int patientIndex = _profileNotifier.connectedUsersData.indexWhere((element) => element.id == _patientNotifier.user.id);

      if (patientIndex != -1) {
        _profileNotifier.connectedUsersData[patientIndex].patientSettings.accessibility = accessibilitySetting;
      }
    } else {
      currentUser.patientSettings.accessibility = accessibilitySetting;

      _localDatabaseRepository.setUser(currentUser);
    }
  }

  Future<void> updateMainSettings() async {
    _userSettingRepository.updateMainSettings(
      map: layoutSetting.toMap(),
      userId: currentUser.id,
    );

    if (_userNotifier.user!.isCaregiver) {
      int patientIndex = _profileNotifier.connectedUsersData.indexWhere((element) => element.id == _patientNotifier.user.id);

      if (patientIndex != -1) {
        _profileNotifier.connectedUsersData[patientIndex].patientSettings.layout = layoutSetting;
      }
    } else {
      currentUser.patientSettings.layout = layoutSetting;
      _localDatabaseRepository.setUser(currentUser);
    }
  }

  Future<void> changeVoiceType({required String type}) async {
    voiceType = type;
    await changeTTSVoice(value: type);
    ttsSetting.voiceSetting.voicesNames[language] = type;
    _localDatabaseRepository.setVoice(name: type);
    notifyListeners();
  }

  void changeVoiceSpeed({required VelocityTypes type}) {
    switch (type) {
      case VelocityTypes.slow:
        _ttsServices.changeCustomTTs(true);
        _ttsServices.changeVoiceSpeed(Platform.isIOS ? 0.3 : 1.0);
        break;
      case VelocityTypes.mid:
        _ttsServices.changeCustomTTs(false);
        _ttsServices.changeVoiceSpeed(Platform.isIOS ? 0.5 : .8);
        break;
      case VelocityTypes.fast:
        _ttsServices.changeCustomTTs(true);
        _ttsServices.changeVoiceSpeed(Platform.isIOS ? 0.65 : 1.0);
        break;
    }
    voiceRate = type.name;
    ttsSetting.voiceSetting.voicesSpeed[language] = type;
    notifyListeners();
  }

  Future<void> changeTTSVoice({required String value}) async {
    voiceName = value;
    await _ttsServices.changeCustomTTs(true);
    await _ttsServices.changeTTSVoice(value);
    print(value);
    await _ttsProvider.speak('global.test'.trl);
    notifyListeners();
  }

  Future<void> saveUserVoiceChoice() async {
    await _localDatabaseRepository.setVoice(name: 'name');
  }

  void changeMute({required bool value}) {
    ttsSetting.voiceSetting.mutePict = value;
    mute = value;
    notifyListeners();
  }

  void changeSubtitle({required bool value}) {
    ttsSetting.subtitlesSetting.show = value;
    show = value;
    notifyListeners();
  }

  void changeTextType({required SizeTypes type}) {
    size = type;
    ttsSetting.subtitlesSetting.size = type;
    notifyListeners();
  }

  void changeCapital({required bool value}) {
    capital = value;
    ttsSetting.subtitlesSetting.caps = value;
    notifyListeners();
  }

  void changeSpeed({required double value}) {
    ///change it after doing some other work
    if (value >= 3.0) {}
    accessibilitySetting.clickTime = VelocityTypes.mid;
    sliderValue = value;
    notifyListeners();
  }

  void changeDeviceOnOff({required bool mode}) {
    if (mode) {
      accessibilitySetting.device = DevicesAccessibility.press;
    } else {
      accessibilitySetting.device = DevicesAccessibility.none;
    }
    notifyListeners();
  }

  void changeDevice({required DevicesAccessibility devicesAccessibility}) {
    accessibilitySetting.device = devicesAccessibility;
    selectedAccessibility = devicesAccessibility;
    notifyListeners();
  }

  void changeSelection({required SweepModes modes}) {
    accessibilitySetting.sweepMode = modes;
    selectionType = modes;
    notifyListeners();
  }

  void changeAccessibilitySpeed({required VelocityTypes speed}) {
    accessibilitySetting.sweepSpeed = speed;
    accessibilitySpeed = speed;
    notifyListeners();
  }

  void changeDeleteText({required bool value}) {
    layoutSetting.cleanup = value;
    deleteText = value;
    notifyListeners();
  }

  void changeOneToOne({required bool value}) {
    layoutSetting.oneToOne = value;
    notifyListeners();
  }

  changeEnableShortcuts({required bool value}) {
    layoutSetting.shortcuts.enable = value;
    shortcut = value;
    notifyListeners();
  }

  void changeTablet({required DisplayTypes value}) {
    layoutSetting.display = value;
    boardView = value;
    notifyListeners();
  }

  Future<void> fetchAllVoices() async {
    voices = await _ttsServices.fetchVoices();
    filteredVoices = [];
    final splittedLanguage = language.split('_');

    for (var voice in voices) {
      if ((voice.locale.startsWith(splittedLanguage[0]) || (voice.locale.startsWith(splittedLanguage[0]) && voice.locale.endsWith(splittedLanguage[1]))) && !voice.name.contains('network')) {
        filteredVoices.add(voice);
      }
    }
  }
}

final userSettingsProvider = ChangeNotifierProvider<UserSettingsProvider>((ref) {
  final i18N = GetIt.I<I18N>();
  final userSettingsService = GetIt.I<UserSettingRepository>();

  final UserNotifier userNotifierState = ref.watch(userProvider);
  final PatientNotifier patientNotifierState = ref.watch(patientNotifier.notifier);

  final ProfileNotifier profileNotifier = ref.watch(profileProvider);
  final TTSRepository ttsNotifier = GetIt.I<TTSRepository>();

  final LocalDatabaseRepository localDatabaseRepository = GetIt.I.get<LocalDatabaseRepository>();
  final tts = ref.watch(ttsProvider);

  return UserSettingsProvider(i18N, userSettingsService, userNotifierState, patientNotifierState, localDatabaseRepository, profileNotifier, ttsNotifier, tts);
});
