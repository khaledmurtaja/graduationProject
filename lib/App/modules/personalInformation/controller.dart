import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/models/userModel.dart';

class PersonalInformationScreenController extends GetxController {
  dynamic argumentData = Get.arguments;
  User? userData;
  @override
  void onInit() {
    userData = argumentData['UserModel'];
    super.onInit();
  }
}
