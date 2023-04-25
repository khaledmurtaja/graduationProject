import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonationAppealScreenController extends GetxController {
  TextEditingController searchBarController = TextEditingController();
  bool isAppealTabSelected = true;
  List<String> city=[
    "غزة",
    "بيت حانون",
    "بيت لاهيا",
    "الوسطى",
    "خانيونس",
    "رفح"
  ];

  ///this value will be changed according to the selected blood unit=>be default no unit is selected
  String selectedBloodUnit = "";

  /// if true the selected tab is the appeal
  /// if false the selected tab is the donations tab
  changeSelectedTab({required bool isAppealSelected}) {
    isAppealTabSelected = isAppealSelected;
    update();
  }

  /// change the selected blood unit
  changeSelectedBloodUnit({required String bloodUnit}) {
    selectedBloodUnit = bloodUnit;
    update();
  }
}
