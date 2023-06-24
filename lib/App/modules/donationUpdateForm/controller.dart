import 'package:blood4life/App/modules/donationUpdateForm/repository.dart';
import 'package:blood4life/core/utils/helperFunctions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../donationRecord/controller.dart';

class DonationUpdateFormScreenController extends GetxController {
  late bool needChoice;
  late bool donorChoice;
  late String needyBloodUnitDefaultValue;
  late String needyLocationDefaultValue;
  late String donorAgeDefaultValue;
  late String donorWeightDefaultValue;
  late String donorBloodUnitDefaultValue;
  late String donorLocationDefaultValue;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  List<String> ages=List.generate(
  49, (index) => (index + 17).toString());
  List<String> weights=List.generate(
      99, (index) => (index + 60).toString());
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
  @override
  void onInit() {
    final donationRecordController = Get.find<DonationRecordScreenController>();
    needChoice = donationRecordController.isAppealTabSelected;
    donorChoice = !needChoice;
    if (needChoice) {
      nameOfNeedyController.text =
          donationRecordController.donationAppealModel.fullName;
      phoneOfNeedyController.text =
          donationRecordController.donationAppealModel.phoneNumber;
      needyBloodUnit = donationRecordController.donationAppealModel.bloodType;
      int defaultBloodUnitValueIndex = bloodUnits.lastIndexOf(needyBloodUnit);
      needyBloodUnitDefaultValue = bloodUnits[defaultBloodUnitValueIndex];
      needyCity = donationRecordController.donationAppealModel.location;
      int defaultCityIndex = city.lastIndexOf(needyCity);
      needyLocationDefaultValue = city[defaultCityIndex];
      detailsOfNeedyController.text =
          donationRecordController.donationAppealModel.description;
    } else {
      nameOfDonorController.text=donationRecordController.donationOfferModel.fullName;
      phoneOfDonorController.text=donationRecordController.donationOfferModel.phoneNumber;
      idOfDonorController.text=donationRecordController.donationOfferModel.idNumber;
      ageOfDonor = donationRecordController.donationOfferModel.age;
      int defaultAgeValueIndex = ages.lastIndexOf(ageOfDonor);
      donorAgeDefaultValue = ages[defaultAgeValueIndex];
      weightOfDonor = donationRecordController.donationOfferModel.weight;
      int defaultWeightValueIndex = weights.lastIndexOf(weightOfDonor);
      donorWeightDefaultValue = weights[defaultWeightValueIndex];
      bloodUnitOfDonor = donationRecordController.donationOfferModel.bloodType;
      int defaultBloodUnitValueIndex = bloodUnits.lastIndexOf(bloodUnitOfDonor);
      donorBloodUnitDefaultValue = bloodUnits[defaultBloodUnitValueIndex];
      cityOfDonor = donationRecordController.donationOfferModel.location;
      int defaultCityIndex = city.lastIndexOf(cityOfDonor);
      donorLocationDefaultValue = city[defaultCityIndex];

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

  updateOffer({required int offerId}) async {
    isLoading = true;
    update();
    final repository = Get.find<DonationUpdateFormRepository>();
    final response = await repository.updateDonationOffer(offerId: offerId);
    isLoading = false;
    update();
    if (response != null) {
      showSnackBar(
          title: "تمت العملية بنجاح",
          message: "تم تحديث عرض تبرعك بالدم بنجاح",
          backGroundColor: Colors.green.shade400,
          snackPosition: SnackPosition.TOP);
    }
  }

  updateAppeal({required int appealId}) async {
    isLoading = true;
    update();
    final repository = Get.find<DonationUpdateFormRepository>();
    final response = await repository.updateDonationAppeal(appealId: appealId);
    isLoading = false;
    update();
    if (response != null) {
      showSnackBar(
          title: "تمت العملية بنجاح",
          message: "تم تحديث مناشدتك للتبرع بالدم بنجاح",
          backGroundColor: Colors.green.shade400,
          snackPosition: SnackPosition.TOP);
    }
  }
}
