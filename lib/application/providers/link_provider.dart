import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';
import 'package:ottaa_project_flutter/application/locator.dart';
import 'package:ottaa_project_flutter/application/providers/profile_provider.dart';
import 'package:ottaa_project_flutter/core/abstracts/user_model.dart';
import 'package:ottaa_project_flutter/core/models/base_user_model.dart';
import 'package:ottaa_project_flutter/core/repositories/auth_repository.dart';
import 'package:ottaa_project_flutter/core/repositories/profile_repository.dart';
import 'package:ottaa_project_flutter/core/use_cases/create_email_token.dart';
import 'package:ottaa_project_flutter/core/use_cases/verify_email_token.dart';

class LinkNotifier extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> codeFormKey = GlobalKey<FormState>();

  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
  List<TextEditingController> controllers = List.generate(4, (index) => TextEditingController());

  final CreateEmailToken createEmailToken;
  final VerifyEmailToken verifyEmailToken;

  final AuthRepository _auth;

  final ProfileRepository _profileService;

  final ProfileNotifier _profileNotifier;

  LinkNotifier(this.createEmailToken, this.verifyEmailToken, this._profileService, this._auth, this._profileNotifier);

  String? userId;
  UserModel? user;

  void tokenChanged(int id, String value) {
    if (value.length > 2) {
      value.characters.take(4).toList().forEachIndexed((index, element) {
        controllers[index].text = element;
      });
      return;
    }

    if (value.isEmpty) {
      if (id == 0) return;

      focusNodes[id].unfocus();
      focusNodes[id - 1].requestFocus();
      return;
    }

    final code = value.characters.last;

    controllers[id].text = code;

    if (id != 3) {
      focusNodes[id].unfocus();
      focusNodes[id + 1].requestFocus();
    } else {
      focusNodes[id].unfocus();
    }
  }

  Future<String?> sendEmail() async {
    if (formKey.currentState?.validate() ?? false) {
      final currentUser = await _auth.getCurrentUser();
      if (currentUser.isRight) {
        final email = currentUser.right.email;
        return await createEmailToken.createEmailToken(email, emailController.text);
      }
    }

    return "Error";
  }

  bool isValidCode() {
    final code = controllers.map((e) => e.text).join();
    return code.length == 4 && (codeFormKey.currentState?.validate() ?? false);
  }

  Future<String?> validateCode() async {
    final code = controllers.map((e) => e.text).join();
    final currentUser = await _auth.getCurrentUser();
    if (currentUser.isRight) {
      final email = currentUser.right.email;
      final result = await verifyEmailToken.verifyEmailToken(
        email,
        emailController.text,
        code,
      );

      if (result.isLeft) {
        return result.left;
      }

      userId = result.right;

      user = await _profileNotifier.fetchUserById(userId!);

      return null;
    }

    return "Error";
  }

  void reset() {
    focusNodes = List.generate(4, (index) => FocusNode());
    controllers = List.generate(4, (index) => TextEditingController());

    formKey.currentState?.reset();
    codeFormKey.currentState?.reset();
    notifyListeners();
  }
}

final linkProvider = ChangeNotifierProvider.autoDispose<LinkNotifier>((ref) {
  final createEmailToken = getIt<CreateEmailToken>();
  final verifyEmailToken = getIt<VerifyEmailToken>();
  final authRepository = getIt<AuthRepository>();
  final profileRepository = getIt<ProfileRepository>();
  return LinkNotifier(createEmailToken, verifyEmailToken, profileRepository, authRepository, ref.read(profileProvider));
});
