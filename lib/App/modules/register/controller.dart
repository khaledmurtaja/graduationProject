import 'package:blood4life/App/modules/register/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/values/strings.dart';
import '../../data/services/sharedPrefService.dart';
import '../home/controller.dart';

class RegisterScreenController extends GetxController {
  bool securePasswordField = true;
  bool securePasswordConfirmField = true;
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode passwordConfirmFocusNode = FocusNode();

  onPasswordIconClicked() {
    /// for controlling password visibility icon
    securePasswordField = !securePasswordField;
    update();
  }

  onPasswordConfirmIconClicked() {
    /// for controlling password confirm  visibility icon
    securePasswordConfirmField = !securePasswordConfirmField;
    update();
  }

  registerUser({required RegisterScreenController controller}) async {
    final registerRepo = Get.find<RegisterRepository>();
    final homeController=Get.find<HomeScreenController>();
    isLoading = true;
    update();
    final response = await registerRepo.
    register();
    isLoading = false;
    update();
    if (response != null) {
      final sharedPref = Get.find<AppSharedPref>();
      sharedPref.putStringValue(
          key: 'token', value: response.data['token'].toString());
      sharedPref.putBoolValue(key: loginPageKey, value: true);
      sharedPref.putStringValue(key: userEmailKey, value: emailController.text);
      sharedPref.putBoolValue(key: isEmailVerifiedKey, value: false);
      homeController.isLoggedIn=true;
      ///user is logged in
      Get.offAllNamed("/emailVerification");
    }
  }
}
