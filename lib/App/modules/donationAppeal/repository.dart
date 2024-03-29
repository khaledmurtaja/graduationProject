import 'package:blood4life/core/values/apiEndPoints.dart';
import 'package:get/get.dart';
import '../../data/models/donationAppealModel.dart';
import '../../data/models/donationOfferModel.dart';
import '../../data/services/apiService.dart';

class DonationAppealRepository {
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

  Future<List<DonationOfferModel>> getOffers({required int pageKey}) async {
    final response = await apiService.getRequest(
        url: ApiEndPoints.BASE_URL + ApiEndPoints.PUBLIC_OFFERS,
        pathParameter: "?page=$pageKey");
    final List<dynamic> jsonList = response?.data['data'];
    final List<DonationOfferModel> offers =
        jsonList.map((json) => DonationOfferModel.fromJson(json)).toList();
    return offers;
  }
  
}
