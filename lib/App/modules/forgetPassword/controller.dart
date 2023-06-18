import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:dio/src/response.dart' as api;

import '../../../core/utils/helperFunctions.dart';
import '../../../core/values/apiEndPoints.dart';
import '../../../core/values/colors.dart';
import '../../../routes/routes.dart';
import '../../data/services/apiService.dart';

class ForgetPasswordScreenController extends GetxController {
  bool sendingOtpLoading = false;
  TextEditingController emailController = TextEditingController();
  final apiService = Get.find<ApiService>();

  Future<api.Response?> sendForgetPasswordOtp() async {
    try {
      sendingOtpLoading = true;
      update();
      final response = await apiService.postRequest(
        url: ApiEndPoints.BASE_URL + ApiEndPoints.sendForgetPasswordCode,
        data: {'email': emailController.text},
      );
      sendingOtpLoading = false;
      update();
      Get.toNamed(Routes.SEND_FORGOT_PASSWORD_VERIFICATION,arguments: emailController.text);
      return response;
    } on Exception catch (e) {
      print(e.toString());
      sendingOtpLoading = false;
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
  emailChanged(){
    update();
  }
}
