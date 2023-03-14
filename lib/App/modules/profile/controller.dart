import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProfileScreenController extends GetxController {
  bool switchValueReadytoDonate = true;
  bool switchValueNotification = true;

  void toggleReadytoDonate(bool) {
    switchValueReadytoDonate = switchValueReadytoDonate ? false : true;
    update();
  }

  void toggleNotification(bool) {
    switchValueNotification = switchValueNotification ? false : true;
    update();
  }
}
