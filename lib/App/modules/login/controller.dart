import 'package:blood4life/App/modules/home/controller.dart';
import 'package:blood4life/App/modules/login/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/helperFunctions.dart';
import '../../../core/values/strings.dart';
import '../../data/services/sharedPrefService.dart';

class LoginScreenController extends GetxController {
  bool securePassword = true;
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  onRedEyeClicked() {
    /// for controlling password visibility icon
    securePassword = !securePassword;
    update();
  }

  ///user login to the system
  loginUser({required LoginScreenController controller}) async {
    isLoading = true;
    final loginRepo = Get.find<LoginRepository>();

    ///this object may have various login implementations
    final homeController = Get.find<HomeScreenController>();
    update();
    final response = await loginRepo.login();
    isLoading = false;
    update();
    final sharedPref = Get.find<AppSharedPref>();
    if (response != null) {
      sharedPref.putStringValue(key: 'token', value: response.data['token']);
      sharedPref.putBoolValue(key: loginPageKey, value: true);
      homeController.isLoggedIn = true;
      Get.toNamed("/home");
      showSnackBar(
          title: "تم تسجيل دخولك بنجاح",
          message: "يمكنك الان نشر المناشدات او العروض للتبرع بالدم",
          backGroundColor: Colors.green.shade400,
          snackPosition: SnackPosition.TOP);
    }

    ///user is logged in
  }
}
