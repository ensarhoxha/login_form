import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_form/screens/enter_code_screen.dart';
import 'package:login_form/screens/success_screen.dart';

class AuthenticationProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  bool _emailIsValid = false;
  bool _codeIsValid = false;
  bool _screenLoading = false;
  bool _showEmailError = false;

  bool get screenLoading => _screenLoading;

  bool get emailIsValid => _emailIsValid;

  bool get codeIsValid => _codeIsValid;

  bool get showEmailError => _showEmailError;

  set showEmailError(bool value) {
    _showEmailError = value;
    notifyListeners();
  }

  set codeIsValid(bool value) {
    _codeIsValid = value;
    notifyListeners();
  }

  set emailIsValid(bool value) {
    _emailIsValid = value;
    notifyListeners();
  }

  set screenLoading(bool value) {
    _screenLoading = value;
    notifyListeners();
  }

  void validateEmail(String email) {
    emailIsValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  void sendCode(BuildContext context) {
    if (emailController.text == "ensar@gmail.com") {
      showEmailError = true;
    } else {
      showEmailError = false;
      screenLoading = true;
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const EnterCodeScreen()));
        screenLoading = false;
      });
    }
  }

  void validateCode(String code) {
    if (code == "2222") {
      codeIsValid = true;
    } else {
      codeIsValid = false;
    }
  }

  void continueToSuccessScreen(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const SuccessScreen()),
            (Route<dynamic> route) => false);
  }
}
