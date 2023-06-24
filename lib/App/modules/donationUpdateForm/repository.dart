import 'package:blood4life/core/values/apiEndPoints.dart';
import 'package:dio/src/response.dart' as api;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/errors/exceptions.dart';
import '../../../core/utils/helperFunctions.dart';
import '../../data/models/donationAppealModel.dart';
import '../../data/models/donationOfferModel.dart';
import '../../data/services/apiService.dart';
import '../../data/services/sharedPrefService.dart';
import 'controller.dart';

class DonationUpdateFormRepository {
  final apiService = Get.find<ApiService>();
  final controller = Get.find<DonationUpdateFormScreenController>();
  final sharedPref = Get.find<AppSharedPref>();

  Future<api.Response?> updateDonationOffer({required int offerId}) async {
    try {
      String? token = sharedPref.getStringValue(key: "token");
      final response = await apiService.putRequest(
          url: ApiEndPoints.BASE_URL +
              ApiEndPoints.UPDATE_OFFER +
              offerId.toString(),
          additionalHeaders: {"Authorization": "Bearer $token"},
          data: DonationOfferModel(
                  fullName: controller.nameOfDonorController.text,
                  bloodType: controller.bloodUnitOfDonor,
                  phoneNumber: controller.phoneOfDonorController.text,
                  location: controller.cityOfDonor,
                  weight: controller.weightOfDonor,
                  age: controller.ageOfDonor,
                  idNumber: controller.idOfDonorController.text)
              .toJson());
      return response;
    } on Exception catch (exception) {
      if (exception is TooManyRequestsException) {
        showSnackBar(
            message:
                "لا يمكنك التبرع بالدم مرة اخرى, الا بعد انقضاء 60 يوم من تاريخ التبرع",
            snackPosition: SnackPosition.TOP);
      } else if (exception is ConflictException) {
        showSnackBar(
            message:
                "رقم الهوية مستخدم في طلب تبرع سابق, وهو حاليا قيد المعالجة",
            snackPosition: SnackPosition.TOP,
            backGroundColor: Colors.deepOrangeAccent);
      } else {
        showSnackBar(message: "حدث خطأ غير متوقع, اعد المحاولة لاحقا");
      }
    }
    return null;
  }

  Future<api.Response?> updateDonationAppeal({required int appealId}) async {
    try {
      String? token = sharedPref.getStringValue(key: "token");
      final response = await apiService.putRequest(
          url: ApiEndPoints.BASE_URL +
              ApiEndPoints.UPDATE_APPEAL +
              appealId.toString(),
          additionalHeaders: {"Authorization": "Bearer $token"},
          data: DonationAppealModel(
                  fullName: controller.nameOfNeedyController.text,
                  bloodType: controller.needyBloodUnit,
                  phoneNumber: controller.phoneOfNeedyController.text,
                  location: controller.needyCity,
                  description: controller.detailsOfNeedyController.text)
              .toJson());
      return response;
    } on Exception catch (exception) {
      if (kDebugMode) {
        print(exception.toString());
      }
      showSnackBar(
          message:
              "حدثت مشكلة اثناء تحديث المناشدة وسنعمل على حلها في اقرب وقت ممكن.");
    }
    return null;
  }
}
