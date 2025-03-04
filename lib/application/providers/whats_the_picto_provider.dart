import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:ottaa_project_flutter/application/common/extensions/translate_string.dart';
import 'package:ottaa_project_flutter/application/providers/games_provider.dart';
import 'package:ottaa_project_flutter/application/providers/tts_provider.dart';
import 'package:ottaa_project_flutter/application/notifiers/patient_notifier.dart';
import 'package:ottaa_project_flutter/application/providers/games_provider.dart';
import 'package:ottaa_project_flutter/application/providers/tts_provider.dart';
import 'package:ottaa_project_flutter/application/providers/user_provider.dart';
import 'package:ottaa_project_flutter/core/repositories/chatgpt_repository.dart';

class WhatsThePictoProvider extends ChangeNotifier {
  final GamesProvider _gamesProvider;
  final TTSProvider _tts;

  List<bool> pictoShowWhatsThePict = [false, false, false, false];
  int selectedPicto = 0;

  ScrollController boardScrollController = ScrollController();
  bool showText = false;

  Future<void> checkAnswerWhatThePicto({required int index}) async {
    //todo: show the text that it is correct
    selectedPicto = index;
    pictoShowWhatsThePict[index] = !pictoShowWhatsThePict[index];
    showText = !showText;
    notifyListeners();

    if (_gamesProvider.correctPictoWTP == index) {
      await _gamesProvider.playClickSounds(assetName: 'yay');
    } else {
      await _gamesProvider.playClickSounds(assetName: 'ohoh');
    }
    //todo: remove the text around
    pictoShowWhatsThePict[index] = !pictoShowWhatsThePict[index];
    showText = !showText;
    //todo: create the new question
    if (_gamesProvider.correctPictoWTP == index) {
      _gamesProvider.correctScore++;
      if (_gamesProvider.correctScore == 10) {
        _gamesProvider.difficultyLevel++;
      }
      if (_gamesProvider.correctScore == 20) {
        _gamesProvider.difficultyLevel++;
      }
      _gamesProvider.streak++;
      await _gamesProvider.createRandomForGameWTP();
      speakNameWhatsThePicto();
    } else {
      _gamesProvider.incorrectScore++;
      if (_gamesProvider.correctScore == 9) {
        _gamesProvider.difficultyLevel--;
      }
      if (_gamesProvider.correctScore == 19) {
        _gamesProvider.difficultyLevel--;
      }
      _gamesProvider.streak = 0;
    }
    _gamesProvider.clicksPlayer.stop();

    // notifyListeners();
  }

  WhatsThePictoProvider(this._gamesProvider, this._tts);

  void speakNameWhatsThePicto() async {
    await _tts.speak('game.speak_what'.trlf({'name': _gamesProvider.gamePictsWTP[_gamesProvider.correctPictoWTP].text}));
  }

  void notify() {
    notifyListeners();
  }

  void scrollUpBoards() {
    int currentPosition = boardScrollController.position.pixels.toInt();

    if (currentPosition == 0) return;

    boardScrollController.animateTo(
      currentPosition - 96,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  void scrollDownBoards() {
    int currentPosition = boardScrollController.position.pixels.toInt();

    if (currentPosition >= boardScrollController.position.maxScrollExtent) return;

    boardScrollController.animateTo(
      currentPosition + 96,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }
}

final whatsThePictoProvider = ChangeNotifierProvider<WhatsThePictoProvider>((ref) {
  final userState = ref.watch(userProvider.notifier);
  final patientState = ref.watch(patientNotifier.notifier);
  final chatGPTRepository = GetIt.I<ChatGPTRepository>();
  final gamesProvider = ref.watch(gameProvider);
  final tts = ref.watch(ttsProvider);
  return WhatsThePictoProvider(gamesProvider, tts);
});
