import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterScreenController extends GetxController {
  bool securePasswordField = true;
  bool securePasswordConfirmField = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController nameController=TextEditingController();

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
}
