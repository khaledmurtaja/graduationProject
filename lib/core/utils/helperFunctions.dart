import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/consts.dart';

/// Construct a color from a hex code string, of the format #RRGGBB.
Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

String? validateEmail(String email) {
  if (email.isEmpty) {
    return emailIsRequiredMessage;
  } else if (!email.isEmail) {
    return wrongEmailFormatMessage;
  } else {
    return null;
  }
}

/// for validating password field in register screen
String? validatePasswordRegister(
    String password, TextEditingController confirmPasswordController) {
  if (password.isEmpty) {
    return passwordIsRequiredMessage;
  } else if (password.length < 8) {
    return lessThan8charMessage;
  } else if (!uppercaseRegex.hasMatch(password)) {
    return atLeast1UpperCaseLetterMessage;
  } else if (!lowercaseRegex.hasMatch(password)) {
    return atLeast1LowerCaseLetterMessage;
  } else if (!numberRegex.hasMatch(password)) {
    return atLeast1NumberMessage;
  } else if (!specialCharRegex.hasMatch(password)) {
    return atLeast1SpecialCharacterMessage;
  } else if (password != confirmPasswordController.text &&
      confirmPasswordController.text.isNotEmpty) {
    return unMatchedPasswordsMessage;
  } else {
    return null;
  }
}
/// for validating password field in login screen
String? validatePasswordLogin(String password) {
  if (password.isEmpty) {
    return passwordIsRequiredMessage;
  } else {
    return null;
  }
}

///for validating name Filed
String? validateNameField(String name) {
  if (name.isEmpty) {
    return nameIsRequiredMessage;
  } else if (name.length < 4 || name.length > 30) {
    return nameMustHave4LettersAtLeastMessage;
  } else if (name.length > 30) {
    return nameMustHave30LettersAtMostMessage;
  } else {
    return null;
  }
}
