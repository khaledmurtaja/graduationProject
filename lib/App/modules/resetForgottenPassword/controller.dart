import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/helperFunctions.dart';
import '../../../core/values/apiEndPoints.dart';
import '../../../core/values/colors.dart';
import '../../../routes/routes.dart';
import '../../data/services/apiService.dart';
import 'package:dio/src/response.dart' as api;
import '../../data/services/sharedPrefService.dart';

class ResetForgottenPasswordScreenController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final sharedPref = Get.find<AppSharedPref>();
  final apiService = Get.find<ApiService>();
  bool securePassword = true;
  bool secureConfirmPassword = true;
  bool isLoading = false;

  onRedEyeClicked() {
    /// for controlling password visibility icon
    securePassword = !securePassword;
    update();
  }

  Future<api.Response?> resetPassword({required String email}) async {
    try {
      String? token = sharedPref.getStringValue(key: "token");

      isLoading = true;
      update();
      final response = await apiService.putRequest(
        url: ApiEndPoints.BASE_URL + ApiEndPoints.RESET_FORGOTTEN_PASSWORD,
        additionalHeaders: {"Authorization": "Bearer $token"},
        data: {
          'password': passwordController.text,
          'password_confirmation': confirmNewPasswordController.text,
          'email': email
        },
      );
      isLoading = false;
      update();
      Get.offNamed(Routes.LOGIN);
      showSnackBar(
          message: 'يمكنك الان تسجيل الدخول',
          backGroundColor: Colors.green,
          snackPosition: SnackPosition.TOP,
          title: "تم تغيير كلمة السر بنجاح");
      return response;
    } on Exception catch (e) {
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
