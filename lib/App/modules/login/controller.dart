import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginScreenController extends GetxController{
  bool securePassword=true;
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  onRedEyeClicked(){ /// for controlling password visibility icon
    securePassword=!securePassword;
    update();
  }

}