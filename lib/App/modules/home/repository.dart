// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/src/response.dart' as api;
import 'package:get/get.dart';

import 'package:blood4life/App/modules/home/controller.dart';
import 'package:blood4life/core/values/apiEndPoints.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/utils/helperFunctions.dart';
import '../../data/models/campaignModel.dart';
import '../../data/models/donationAppealModel.dart';
import '../../data/services/apiService.dart';

class HomeRepository {
  // final homeScreenController = Get.find<HomeScreenController>();
  // static HomeScreenController get to => Get.find<HomeScreenController>();
  final apiService = Get.find<ApiService>();

  Future<List<DonationAppealModel>> getAppeals({required int pageKey}) async {
    final response = await apiService.getRequest(
        url: ApiEndPoints.BASE_URL + ApiEndPoints.PUBLIC_APPEALS,
        pathParameter: "?page=$pageKey");
    final List<dynamic> jsonList = response?.data['data'];
    final List<DonationAppealModel> appeals =
        jsonList.map((json) => DonationAppealModel.fromJson(json)).toList();
    return appeals;
  }

  Future<List<CampaignModel>?> getCampaigns() async {
    try {
      final response = await apiService.getRequest(
        url: ApiEndPoints.BASE_URL + ApiEndPoints.CAMPAINGNS,
      );

      final List<dynamic> jsonList = response?.data['data'];
      final List<CampaignModel> campaigns =
          jsonList.map((json) => CampaignModel.fromJson(json)).toList();
      return campaigns;
    } on Exception catch (exception) {
      if (exception is ServerException) {
        showSnackBar(
            message: "يوجد مشكلة في السيرفر حاول مرة أخرى !!",
            snackPosition: SnackPosition.TOP);
      } else {
        showSnackBar(
            message: "حدث خلل ما حاول مرة أخرى !!",
            snackPosition: SnackPosition.TOP);
      }
    }
  }
}
