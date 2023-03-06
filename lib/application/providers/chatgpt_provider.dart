import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:ottaa_project_flutter/application/notifiers/patient_notifier.dart';
import 'package:ottaa_project_flutter/application/notifiers/user_notifier.dart';
import 'package:ottaa_project_flutter/core/models/picto_model.dart';
import 'package:ottaa_project_flutter/core/repositories/chatgpt_repository.dart';

class ChatGPTNotifier extends ChangeNotifier {
  final UserNotifier _userNotifier;
  final PatientNotifier _patientNotifier;
  final ChatGPTRepository _chatGPTRepository;

  ChatGPTNotifier(this._userNotifier, this._patientNotifier, this._chatGPTRepository);

  Future<String?> generatePhrase(List<Picto> pictograms) async {
    final user = _patientNotifier.state ?? _userNotifier.user;

    String age = (user.settings.data.birthDate.difference(DateTime.now()).inDays / 365).toString();

    String gender = user.settings.data.genderPref;

    String pictogramsString = pictograms.map((e) => e.text).join(", ");

    final response = await _chatGPTRepository.getCompletion(age: age, gender: gender, pictograms: pictogramsString);

    return response.fold(
      (l) => null,
      (r) => r,
    );
  }
}

final chatGPTProvider = ChangeNotifierProvider<ChatGPTNotifier>((ref) {
  final userState = ref.watch(userNotifier.notifier);
  final patientState = ref.watch(patientNotifier.notifier);
  final chatGPTRepository = GetIt.I<ChatGPTRepository>();

  return ChatGPTNotifier(userState, patientState, chatGPTRepository);
});