import 'package:blood4life/App/modules/donationForm/repository.dart';
import 'package:blood4life/core/utils/helperFunctions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonationFormScreenController extends GetxController {
  bool needChoice = false;
  bool donorChoice = true;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  List<String> city = [
    "غزة",
    "بيت حانون",
    "بيت لاهيا",
    "الوسطى",
    "خانيونس",
    "رفح"
  ];
  List<String> bloodUnits = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];

  // Controllers for needChoice
  TextEditingController nameOfNeedyController = TextEditingController();
  TextEditingController phoneOfNeedyController = TextEditingController();
  TextEditingController detailsOfNeedyController = TextEditingController();
  //focus nodes for need controllers
  final FocusNode nameOfNeedFocusNode = FocusNode();
  final FocusNode phoneOfNeedFocusNode = FocusNode();
  final FocusNode detailsOfNeedFocusNode = FocusNode();

  // Controllers for donorChoice
  TextEditingController nameOfDonorController = TextEditingController();
  TextEditingController phoneOfDonorController = TextEditingController();
  TextEditingController idOfDonorController = TextEditingController();
  //focus nodes for donor controllers
  final FocusNode nameOfDonorFocusNode = FocusNode();
  final FocusNode phoneOfDonorFocusNode = FocusNode();
  final FocusNode idOfDonorFocusNode = FocusNode();

  //donorVariables
  String ageOfDonor = "";
  String weightOfDonor = "";
  String bloodUnitOfDonor = "";
  String cityOfDonor = "";
  //needy variables
  String needyBloodUnit = "";
  String needyCity = "";
  bool get allNeedFormFieldsIsEmpty =>
      nameOfNeedyController.text.isEmpty &&
      phoneOfNeedyController.text.isEmpty &&
      needyBloodUnit.isEmpty &&
      needyCity.isEmpty;
  bool get allDonorFormFieldsIsEmpty =>
      nameOfDonorController.text.isEmpty &&
      phoneOfDonorController.text.isEmpty &&
      idOfDonorController.text.isEmpty &&
      ageOfDonor.isEmpty &&
      weightOfDonor.isEmpty &&
      bloodUnitOfDonor.isEmpty &&
      cityOfDonor.isEmpty;

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

  onChangeDonorAge({required String age}) {
    ageOfDonor = age;
  }

  onchangeDonorWeight({required String weight}) {
    weightOfDonor = weight;
  }

  onChangeDonorBloodUnit({required String bloodUnit}) {
    bloodUnitOfDonor = bloodUnit;
  }

  onChangeDonorCity({required String city}) {
    cityOfDonor = city;
  }

  onChangeNeedyBloodUnit({required String bloodUnit}) {
    needyBloodUnit = bloodUnit;
  }

  onChangeNeedyCity({required String city}) {
    needyCity = city;
  }

  shareOffer() async {
    isLoading = true;
    update();
    final repository = Get.find<DonationFormRepository>();
    final response = await repository.shareDonationOffer();
    isLoading = false;
    update();
    if (response != null) {
      showSnackBar(
          title: "تمت العملية بنجاح",
          message: "تم نشر عرض تبرعك بالدم بنجاح",
          backGroundColor: Colors.green.shade400,
          snackPosition: SnackPosition.TOP);
    }
  }

  shareAppeal() async {
    isLoading = true;
    update();
    final repository = Get.find<DonationFormRepository>();
    final response = await repository.shareDonationAppeal();
    isLoading = false;
    update();
    if (response != null) {
      showSnackBar(
          title: "تمت العملية بنجاح",
          message: "تم نشر مناشدتك للتبرع بالدم بنجاح",
          backGroundColor: Colors.green.shade400,
          snackPosition: SnackPosition.TOP);
    }
  }
}
