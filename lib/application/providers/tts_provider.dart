import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:ottaa_project_flutter/core/models/voices_model.dart';
import 'package:ottaa_project_flutter/core/repositories/repositories.dart';
import 'package:async/async.dart';

class TTSProvider extends ChangeNotifier {
  final TTSRepository tts;
  final LocalDatabaseRepository _hiveRepository;

  CancelableOperation? speakOperation;

  TTSProvider(this.tts, this._hiveRepository);

  Future<void> speak(String text) async {
    await speakOperation?.cancel();
    speakOperation = null;
    await Future.delayed(Duration(milliseconds: 500));

    speakOperation = CancelableOperation.fromFuture(
      tts.speak(text),
      onCancel: () {
        print('cancelled $text');
        speakOperation = null;
      },
    );

    await speakOperation?.value;

    speakOperation = null;
  }

  Future<List<Voices>> fetchVoices(String languageCode) async {
    return await tts.fetchVoices();
  }

  Future<void> changeVoiceSpeed(double speed) async {
    tts.changeVoiceSpeed(speed);
  }

  Future<void> changeCustomTTs(bool value) async {
    tts.changeCustomTTs(value);
  }

  Future<void> changeTTSVoice(String voice) async {
    tts.changeTTSVoice(voice);
  }

  Future<void> init() async {
    final res = await _hiveRepository.getVoice();
    if (res == '') {
      return;
    } else {
      await changeTTSVoice(res);
    }
  }
}

final ttsProvider = ChangeNotifierProvider<TTSProvider>((ref) {
  final tts = GetIt.I<TTSRepository>();
  final LocalDatabaseRepository localDatabaseRepository = GetIt.I.get<LocalDatabaseRepository>();
  return TTSProvider(tts, localDatabaseRepository);
});
