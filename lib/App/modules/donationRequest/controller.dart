import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonationRequestScreenController extends GetxController {
  bool needChoice = true;
  bool donorChoice = false;
  TextEditingController nameOfTheNeedyController = TextEditingController();

  void changeSelection() {
    if (needChoice == true && donorChoice == false) {
      needChoice = false;
      donorChoice = true;
      update();
    } else {
      needChoice = true;
      donorChoice = false;
      update();
    }
  }
}
