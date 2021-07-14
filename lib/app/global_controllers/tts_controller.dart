import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

enum TtsState { playing, stopped, paused, continued }

class TTSController extends GetxController {
  late FlutterTts _flutterTTS;
  String _language = "en-US";
  String get languaje => this._language;
  set languaje(value) {
    this._language = value;
  }

  bool _isEnglish = true;
  bool get isEnglish => this._isEnglish;
  set isEnglish(value) {
    this._isEnglish = value;
  }

  // ignore: unused_field
  String? _engine;

  double _volume = 0.8;
  double get volume => this._volume;

  double _pitch = 1.0;
  double get pitch => this._pitch;
  set pitch(value) {
    this._pitch = value;
  }

  double _rate = 0.4;
  double get rate => this._rate;
  set rate(value) {
    this._rate = value;
  }

  // bool isCurrentLanguageInstalled = false;

  TtsState _ttsState = TtsState.stopped;

  get isPlaying => this._ttsState == TtsState.playing;
  get isStopped => this._ttsState == TtsState.stopped;
  get isPaused => this._ttsState == TtsState.paused;
  get isContinued => this._ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWeb => kIsWeb;

  @override
  void onInit() async {
    _initTTS();
    super.onInit();
  }

  @override
  void onClose() {
    this._flutterTTS.stop();
    super.onClose();
  }

  _initTTS() {
    this._flutterTTS = FlutterTts();

    if (isAndroid) {
      _getDefaultEngine();
    }

    this._flutterTTS.setStartHandler(() {
      print("Playing");
      this._ttsState = TtsState.playing;
    });

    this._flutterTTS.setCompletionHandler(() {
      print("Complete");
      this._ttsState = TtsState.stopped;
    });

    this._flutterTTS.setCancelHandler(() {
      print("Cancel");
      this._ttsState = TtsState.stopped;
    });

    if (isWeb || isIOS) {
      this._flutterTTS.setPauseHandler(() {
        print("Paused");
        this._ttsState = TtsState.paused;
      });

      this._flutterTTS.setContinueHandler(() {
        print("Continued");
        this._ttsState = TtsState.continued;
      });
    }

    this._flutterTTS.setErrorHandler((msg) {
      print("error: $msg");
      this._ttsState = TtsState.stopped;
    });
  }

  // Future<dynamic> _getLanguages() => flutterTts.getLanguages;

  // Future<dynamic> _getEngines() => flutterTts.getEngines;

  Future _getDefaultEngine() async {
    this._engine = await this._flutterTTS.getDefaultEngine;
  }

  Future speak(String voiceText) async {
    if (voiceText.isNotEmpty) {
      await this._flutterTTS.setVolume(this._volume);
      await this._flutterTTS.setSpeechRate(this._rate);
      await this._flutterTTS.setPitch(this._pitch);
      await this._flutterTTS.awaitSpeakCompletion(true);
      await this._flutterTTS.setLanguage(this._language);
      // var voice = await flutterTTS.getVoices;
      // print(voice.where((element) => element["locale"] == "es-US"));
      // await flutterTTS.setVoice({"name": "es-US-language", "locale": "es-US"});
      await this._flutterTTS.speak(voiceText);
    }
  }
}