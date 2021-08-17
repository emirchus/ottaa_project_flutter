import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ottaa_project_flutter/app/global_widgets/ottaa_loading_widget.dart';
import 'package:ottaa_project_flutter/app/routes/app_routes.dart';
import 'package:ottaa_project_flutter/app/services/auth_service.dart';
import 'package:ottaa_project_flutter/app/utils/app_dialogs.dart';

enum SignInType { EMAIL_PASSWORD, GOOGLE, FACEBOOK, APPLE }

var firebaseUser = FirebaseAuth.instance.currentUser;

class AuthController extends GetxController {
  GlobalKey<FormState> formSignUpKey = new GlobalKey<FormState>();
  GlobalKey<FormState> formLogInKey = new GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String name = '';
  String email = '';
  String password = '';
  String codigo = '';

  bool validateSignUpForm() {
    if (formSignUpKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  bool validateLogInForm() {
    if (formLogInKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void onSignUpSubmit() {
    final isValid = this.validateSignUpForm();
    if (isValid)
      // authProvider.login(loginFormProvider.email, loginFormProvider.password);
      this.handleSignUp(email: email, password: password, name: name);
  }

  void onLogInSubmit() {
    final isValid = this.validateLogInForm();
    if (isValid)
      // authProvider.login(loginFormProvider.email, loginFormProvider.password);
      this.handleSignIn(SignInType.EMAIL_PASSWORD,
          email: email, password: password, name: name);
  }

  User? get firebaseUser => FirebaseAuth.instance.currentUser;

  late AuthService _authService;

  @override
  void onInit() async {
    _authService = AuthService();
    super.onInit();
  }

  bool _validateEmailAndPassword(String? email, String? password) {
    if (email == null || email.isEmpty || !GetUtils.isEmail(email)) {
      AppDialogs.showInvalidEmailDialog();
      return false;
    }
    if (password == null || password.isEmpty) {
      AppDialogs.showEmptyPasswordDialog();
      return false;
    }
    return true;
  }

  handleSignIn(SignInType type,
      {String? email, String? password, String? name}) async {
    if (type == SignInType.EMAIL_PASSWORD) {
      if (!_validateEmailAndPassword(email!, password!)) return;
      await _authRequest(
          _authService.signInWithEmailAndPassword(email, password),
          "Ingresando");
    }
    if (type == SignInType.GOOGLE) {
      await _authRequest(
          _authService.signInWithGoogle(), "Conectando con Google");
    }
    if (type == SignInType.FACEBOOK) {
      await _authRequest(
          _authService.signInWithFacebook(), "Conectando con Facebook");
    }
  }

  handleSignUp(
      {required String email,
      required String password,
      required String name}) async {
    if (!_validateEmailAndPassword(email, password)) return;
    await _authRequest(
        _authService.signUp(email: email, password: password, name: name),
        "Registrando");
  }

  handleSignOut() async {
    await _authService.signOut();
    Get.offAllNamed(AppRoutes.LOGIN);
  }

  _authRequest(Future<UserCredential> future, String loadingMessage) async {
    Get.to(OttaaLoading(textToShow: loadingMessage));
    try {
      await future;
      // if ok firebase will return a user else will throw an exception
      Get.offAllNamed(AppRoutes.ONBOARDING);
    } on PlatformException catch (e) {
      print(e.code);
      Get.back();
      switch (e.code) {
        case 'popup_closed_by_user':
          break;
        default:
          AppDialogs.showUnknownErrorDialog();
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      Get.back();
      switch (e.code) {
        case 'sign_in_failed':
          // this error comes due to fingerprint SHA1 and SHA256
          AppDialogs.showInformationDialog("Error en el Login",
              "La aplicación no se pudo loguear (sign-in-failed)");
          break;
        case 'account-exists-with-different-credential':
          AppDialogs.showInformationDialog("Ya exite la cuenta",
              "El mail de la cuenta está asociado a otro método de login");
          break;
        case "too-many-requests":
          AppDialogs.showInformationDialog("Límite de intentos alcanzado",
              "Espere unos minutos y vuelva a intentar acceder nuevamente");
          break;
        case "email-already-in-use":
          AppDialogs.showInformationDialog("Email ya registrado",
              "El email ya está registrado para otra plataforma");
          break;
        case "email-already-exists":
          AppDialogs.showEmailAlreadyExistsDialog();
          break;
        case 'weak-password':
          AppDialogs.showWeakPasswordDialog();
          break;
        case 'invalid-email':
          AppDialogs.showInvalidEmailDialog();
          break;
        case 'invalid-password':
          AppDialogs.showInvalidPasswordDialog();
          break;
        case 'wrong-password':
          AppDialogs.showInvalidPasswordDialog();
          break;
        case 'user-not-found':
          AppDialogs.showUserNotFoundDialog();
          break;
        default:
          AppDialogs.showUnknownErrorDialog();
      }
    } catch (e) {
      print(e);
      Get.back();
      switch (e.toString()) {
        case 'Unexpected null value.':
          break;
        default:
          AppDialogs.showUnknownErrorDialog();
      }
    }
  }
}
