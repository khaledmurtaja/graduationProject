import 'package:get/get.dart';
import '../../../core/values/apiEndPoints.dart';
import '../../data/models/donationAppealModel.dart';
import '../../data/models/donationOfferModel.dart';
import '../../data/services/apiService.dart';
import '../../data/services/sharedPrefService.dart';

class UserDonationDataRepository {
  final apiService = Get.find<ApiService>();
  final sharedPref = Get.find<AppSharedPref>();

  Future<List<DonationAppealModel>> getAppeals({required int pageKey}) async {
    try {
      String? token = sharedPref.getStringValue(key: "token");
      final response = await apiService.getRequest(
          url: ApiEndPoints.BASE_URL + ApiEndPoints.USER_APPEALS,
          additionalHeaders: {"Authorization": "Bearer $token"},
          pathParameter: "?page=$pageKey");
      final List<dynamic> jsonList = response?.data['data'];
      final List<DonationAppealModel> appeals = jsonList
          .map((json) => DonationAppealModel.userAppeals(json))
          .toList();
      return appeals;
    } catch (e) {
      throw Exception();
    }
  }

  Future<List<DonationOfferModel>> getOffers({required int pageKey}) async {
    String? token = sharedPref.getStringValue(key: "token");
    final response = await apiService.getRequest(
        url: ApiEndPoints.BASE_URL + ApiEndPoints.USER_OFFERS,
        additionalHeaders: {"Authorization": "Bearer $token"},
        pathParameter: "?page=$pageKey");
    final List<dynamic> jsonList = response?.data['data'];
    final List<DonationOfferModel> offers =
        jsonList.map((json) => DonationOfferModel.userOffers(json)).toList();
    return offers;
  }

  deleteAppeal({required int appealId}) async {
    String? token = sharedPref.getStringValue(key: "token");
    await apiService.delete(
        url: ApiEndPoints.BASE_URL +
            ApiEndPoints.DELETE_APPEAL +
            appealId.toString(),
        token: token!);
  }
  deleteOffer({required int offerId}) async {
    String? token = sharedPref.getStringValue(key: "token");
    await apiService.delete(
        url: ApiEndPoints.BASE_URL +
            ApiEndPoints.DELETE_OFFER +
            offerId.toString(),
        token: token!);
  }
}
