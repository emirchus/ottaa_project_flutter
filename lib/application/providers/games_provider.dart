import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ottaa_project_flutter/application/notifiers/patient_notifier.dart';
import 'package:ottaa_project_flutter/core/models/group_model.dart';
import 'package:ottaa_project_flutter/core/models/picto_model.dart';
import 'package:ottaa_project_flutter/core/repositories/repositories.dart';

class GamesProvider extends ChangeNotifier {
  int numberOfGroups = 45;
  int completedGroups = 0;
  int activeGroups = 00;
  int selectedGame = 0;
  String selectedGroupName = '';
  final PageController mainPageController = PageController(initialPage: 0);
  ScrollController gridScrollController = ScrollController();
  Map<String, Picto> pictograms = {};
  Map<String, Group> groups = {};
  int correctScore = 0;
  int incorrectScore = 0;
  List<Picto> selectedPicts = [];
  int useTime = 00;
  int streak = 0;
  List<bool> matchPictoTop = List.filled(4, false);
  List<bool> matchPictoBottom = List.filled(4, false);
  bool isMute = false;
  List<Picto> gamePictsWTP = [];
  List<Picto> gamePictsMP = [];
  int correctPictoWTP = 99;
  bool hintsBtn = false;
  late Timer hintTimer1, hintTimer2, gameTimer;
  bool hintsEnabled = false;

  /// 0 == 2 pictos, 1 == 3 pictos, 2 == 4 pictos
  int difficultyLevel = 0;

  late final AudioPlayer backgroundMusicPlayer;
  late final AudioPlayer clicksPlayer;

  Map<int, Picto> bottomPositionsMP = {};
  Map<int, Picto> topPositionsMP = {};

  final PictogramsRepository _pictogramsService;
  final GroupsRepository _groupsService;
  final PatientNotifier patientState;

  GamesProvider(
    this._groupsService,
    this._pictogramsService,
    this.patientState, {
    AudioPlayer? backgroundMusicPlayer,
    AudioPlayer? clicksPlayer,
  }) {
    this.backgroundMusicPlayer = backgroundMusicPlayer ?? AudioPlayer();
    this.clicksPlayer = clicksPlayer ?? AudioPlayer();
  }

  Future<void> createRandomForGameWTP() async {
    gamePictsWTP.clear();
    List<int> numbers = [];
    Random random = Random();
    while (numbers.length < difficultyLevel + 2) {
      int randomNum = random.nextInt(selectedPicts.length - 1);
      if (!numbers.contains(randomNum)) {
        numbers.add(randomNum);
      }
    }
    for (var element in numbers) {
      gamePictsWTP.add(selectedPicts[element]);
    }

    correctPictoWTP = Random().nextInt(difficultyLevel + 2);

    notifyListeners();
  }

  resetScore() {
    incorrectScore = 0;
    correctScore = 0;
    gameTimer.cancel();
    useTime = 0;
    streak = 0;
    difficultyLevel = 0;
  }

  Future<void> createRandomForGameMP() async {
    topPositionsMP.clear();
    bottomPositionsMP.clear();
    List<int> topNumbers = [];
    List<int> bottomNumbers = [];
    Random random = Random();
    while (topNumbers.length < difficultyLevel + 2) {
      int num = random.nextInt(selectedPicts.length - 1);
      if (!topNumbers.contains(num)) {
        topNumbers.add(num);
      }
    }
    while (bottomNumbers.length < difficultyLevel + 2) {
      int num = random.nextInt(topNumbers.length);
      if (!bottomNumbers.contains(num)) {
        bottomNumbers.add(num);
      }
    }
    int i = 0;
    for (var element in topNumbers) {
      topPositionsMP[i] = selectedPicts[element];
      i++;
    }
    i = 0;
    for (var element in bottomNumbers) {
      bottomPositionsMP[i] = topPositionsMP[element]!;
      i++;
    }
    notifyListeners();
  }

  Future<void> fetchSelectedPictos() async {
    List<Picto> picts = [];
    final gro = groups.values.where((element) => !element.block).toList();
    int i = 0;
    int selectedGroup = 0;
    for (var e in gro) {
      if (e.text == selectedGroupName) {
        selectedGroup = i;
      }
      i++;
    }
    for (var e in gro[selectedGroup].relations) {
      picts.add(
        pictograms[e.id]!,
      );
    }
    selectedPicts.clear();
    selectedPicts.addAll(picts);
  }

  void moveForward() {
    mainPageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    notifyListeners();
  }

  void moveBackward() {
    mainPageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    notifyListeners();
  }

  void scrollUp() {
    int currentPosition = gridScrollController.position.pixels.toInt();

    if (currentPosition == 0) return;

    gridScrollController.animateTo(
      currentPosition - 96,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  void scrollDown() {
    int currentPosition = gridScrollController.position.pixels.toInt();

    if (currentPosition >= gridScrollController.position.maxScrollExtent + 96) {
      return;
    }

    gridScrollController.animateTo(
      currentPosition + 96,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  Future<void> fetchPictograms() async {
    if (pictograms.isNotEmpty && groups.isNotEmpty) return;

    List<Picto>? pictos;
    List<Group>? groupsData;

    if (patientState.state != null) {
      pictos = patientState.user.pictos[patientState.user.settings.language];

      groupsData = patientState.user.groups[patientState.user.settings.language];
    }

    pictos ??= (await _pictogramsService.getAllPictograms()).where((element) => !element.block).toList();
    groupsData ??= (await _groupsService.getAllGroups()).where((element) => !element.block).toList();

    for (var e in groupsData) {
      if (!e.block) {
        activeGroups++;
      }
    }

    pictograms = Map.fromIterables(pictos.map((e) => e.id), pictos);
    groups = Map.fromIterables(groupsData.map((e) => e.id), groupsData);

    notifyListeners();
  }

  // Future<void> checkAnswerMatchPicto({required bool upper, required int index}) async {}

  Future<void> init() async {
    gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      useTime = useTime + 1;
    });
    await initializeBackgroundMusic();
    if (hintsBtn) {
      showHints();
    }
  }

  Future<void> showHints() async {
    hintTimer1 = Timer.periodic(const Duration(seconds: 4), (timer) {
      hintTimer2 = Timer(const Duration(seconds: 2), () {
        hintsEnabled = true;
        notify();
      });
      hintsEnabled = false;
      notify();
    });
  }

  Future<void> cancelHints() async {
    hintTimer1.cancel();
    hintTimer1.cancel();
    hintTimer2.cancel();
    hintTimer2.cancel();
    hintsEnabled = false;
    // notifyListeners();
  }

  void notify() {
    notifyListeners();
  }

  Future<void> playClickSounds({required String assetName}) async {
    await clicksPlayer.setAsset('assets/audios/$assetName.mp3');
    await clicksPlayer.play();
  }

  Future<void> changeMusic({required bool mute}) async {
    if (mute) {
      await backgroundMusicPlayer.pause();
    } else {
      await backgroundMusicPlayer.play();
    }
  }

  Future<void> initializeBackgroundMusic() async {
    ///check if we can buffer the audios before even loading the properties of the given class
    // backgroundMusicPlayer.setAudioSource();
    if (!isMute) {
      await backgroundMusicPlayer.setAsset('assets/audios/funckygroove.mp3');
      await backgroundMusicPlayer.setLoopMode(LoopMode.one);
      await backgroundMusicPlayer.setVolume(0.2);
      await backgroundMusicPlayer.play();
    }
  }

  @override
  void dispose() {
    hintTimer1.cancel();
    hintTimer2.cancel();
    super.dispose();
  }
}

final ChangeNotifierProvider<GamesProvider> gameProvider = ChangeNotifierProvider<GamesProvider>((ref) {
  final pictogramService = GetIt.I<PictogramsRepository>();
  final groupsService = GetIt.I<GroupsRepository>();
  final patientState = ref.watch(patientNotifier.notifier);
  // final tts = ref.watch(ttsProvider);
  return GamesProvider(groupsService, pictogramService, patientState);
});
