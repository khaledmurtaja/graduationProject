import 'package:blood4life/App/modules/home/controller.dart';
import 'package:blood4life/App/modules/profile/repository.dart';
import 'package:blood4life/core/utils/helperFunctions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController {
  bool switchValueReadytoDonate = true;
  bool switchValueNotification = true;
  bool isLoggingOut = false;

  void toggleReadytoDonate(bool) {
    switchValueReadytoDonate = switchValueReadytoDonate ? false : true;
    update();
  }

  void toggleNotification(bool) {
    switchValueNotification = switchValueNotification ? false : true;
    update();
  }

  logOutUser() async {
    final repository = Get.find<ProfileRepository>();
    final homeController = Get.find<HomeScreenController>();
    final result = await repository.logout();
    if (result == true || result != null) {
      homeController.changeCurrentPageIndex(0);
      homeController.isLoggedIn = false;
      Get.back();
      showSnackBar(
          title: "تم تسجيل خروجك بنجاح",
          message: "انت الان في وضع التصفح الخفي",
          backGroundColor: Colors.deepOrangeAccent,
          snackPosition: SnackPosition.TOP);
    }
  }
}
