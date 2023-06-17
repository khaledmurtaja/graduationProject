import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../core/utils/helperFunctions.dart';
import '../../../core/values/apiEndPoints.dart';
import '../../../core/values/colors.dart';
import '../../../routes/routes.dart';
import '../../data/services/apiService.dart';
import '../../data/services/sharedPrefService.dart';
import 'package:dio/src/response.dart' as api;

class SendVerificationCodeController extends GetxController {
  bool isSendingCodeLoading = false;
  final apiService = Get.find<ApiService>();
  final sharedPref = Get.find<AppSharedPref>();
  Future<api.Response?> sendEmailVerification() async {
    try {
      isSendingCodeLoading = true;
      update();
      String? token = sharedPref.getStringValue(key: "token");
      final response = await apiService.postRequest(
          url: ApiEndPoints.BASE_URL + ApiEndPoints.SEND_EMAIL_VERIFICATION,
          data: {},
          additionalHeaders: {"Authorization": "Bearer $token"});
      Get.offNamed(Routes.EMAIL_VERIFICATION);
      isSendingCodeLoading = false;
      update();
      return response;
    } on Exception catch (e) {
      isSendingCodeLoading = false;
      update();
      if (kDebugMode) {
        print(e);
      }
      showSnackBar(
          message: 'حدث خطأ ما,تأكد من اتصالك بالانترنت',
          backGroundColor: primaryColor);
    }
    return null;
  }
}
