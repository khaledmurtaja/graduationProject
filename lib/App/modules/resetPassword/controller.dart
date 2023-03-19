import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreenController extends GetxController {
  TextEditingController oldPasswordController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();

  TextEditingController confirmNewPasswordController = TextEditingController();
  bool securePassword = true;

  onRedEyeClicked() {
    /// for controlling password visibility icon
    securePassword = !securePassword;
    update();
  }
}
