import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonationFormScreenController extends GetxController {
  bool needChoice = true;
  bool donorChoice = false;

  // Controllers for needChoice
  TextEditingController nameOfNeedyController = TextEditingController();
  TextEditingController phoneOfNeedyController = TextEditingController();
  TextEditingController detailsOfNeedyController = TextEditingController();

  // Controllers for donorChoice
  TextEditingController nameOfDonorController = TextEditingController();
  TextEditingController phoneOfDonorController = TextEditingController();

  void changeSelection(String choice) {
    if (choice == 'donor') {
      donorChoice = true;
      needChoice = false;
      update();
    } else {
      donorChoice = false;
      needChoice = true;
      update();
    }
  }
}
