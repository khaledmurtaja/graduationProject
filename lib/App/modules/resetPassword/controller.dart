import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/helperFunctions.dart';
import '../../../core/values/apiEndPoints.dart';
import '../../../core/values/colors.dart';
import '../../data/services/apiService.dart';
import 'package:dio/src/response.dart' as api;

import '../../data/services/sharedPrefService.dart';
class ResetPasswordScreenController extends GetxController {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isOldPasswordSecured = true;
  bool isNewPasswordSecured = true;
  bool isNewPasswordConfirmationSecured = true;
  final apiService = Get.find<ApiService>();
  bool passwordResetSuccessfully=false;
  final sharedPref = Get.find<AppSharedPref>();
  bool isLoading=false;


  onRedEyeOldPasswordClicked() {
    /// for controlling password visibility icon
    isOldPasswordSecured = !isOldPasswordSecured;
    update();
  }
  onRedEyeNewPasswordClicked() {
    /// for controlling password visibility icon
    isNewPasswordSecured = !isNewPasswordSecured;
    update();
  }
  onRedEyeNewPasswordConfirmationClicked() {
    /// for controlling password visibility icon
    isNewPasswordConfirmationSecured = !isNewPasswordConfirmationSecured;
    update();
  }
  Future<api.Response?> resetPassword() async {
    try {
      String? token = sharedPref.getStringValue(key: "token");
      passwordResetSuccessfully=false;
      isLoading = true;
      update();
      final response = await apiService.putRequest(
        url: ApiEndPoints.BASE_URL + ApiEndPoints.CHANGE_CURRENT_PASSWORD,
        additionalHeaders: {"Authorization": "Bearer $token"},
        data: {
          'old_password': oldPasswordController.text,
          'password': newPasswordController.text,
          'password_confirmation':confirmNewPasswordController.text
        },
      );
      isLoading = false;
      passwordResetSuccessfully=true;
      update();
      return response;
    } on Exception catch (e) {
      passwordResetSuccessfully=false;
      isLoading = false;
      update();
      if (kDebugMode) {
        print(e.toString());
      }
      showSnackBar(
          message: 'حدث خطأ ما,تأكد من اتصالك بالانترنت',
          backGroundColor: primaryColor,
          snackPosition: SnackPosition.BOTTOM);
    }
    return null;
  }

}
