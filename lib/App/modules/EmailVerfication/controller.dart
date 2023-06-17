import 'package:blood4life/routes/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/helperFunctions.dart';
import '../../../core/values/apiEndPoints.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/strings.dart';
import '../../data/services/apiService.dart';
import '../../data/services/sharedPrefService.dart';
import 'package:dio/src/response.dart' as api;

class EmailVerificationController extends GetxController {
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  TextEditingController otp5 = TextEditingController();
  final apiService = Get.find<ApiService>();
  bool isCheckOTPLoading = false;
  String otpCode = "";
  String? userEmail;
  final sharedPref = Get.find<AppSharedPref>();

  @override
  void onInit() {
    userEmail=sharedPref.getStringValue(key: userEmailKey);

  }

  Future<api.Response?> checkOtpCode() async {
    try {
      isCheckOTPLoading=true;
      update();
      String? token = sharedPref.getStringValue(key: "token");
      final response = await apiService.getRequest(
          url: ApiEndPoints.BASE_URL + ApiEndPoints.CHECK_OTP_CODE,
          pathParameter: "code=$otpCode",
          additionalHeaders: {"Authorization": "Bearer $token"});
      isCheckOTPLoading=false;
      update();
      Get.offNamed(Routes.HOME);
      sharedPref.putBoolValue(key: isEmailVerifiedKey, value: true);
      showSnackBar(message: 'تم توثيق البريد الالكتروني',backGroundColor:Colors.green,snackPosition: SnackPosition.TOP,title: "نجاح العملية");
      return response;
    } on Exception catch (e) {
      isCheckOTPLoading=false;
      update();
      if (kDebugMode) {
        print(e.toString());
      }
      showSnackBar(message: 'حدث خطأ ما,تأكد من اتصالك بالانترنت',backGroundColor:primaryColor,snackPosition: SnackPosition.BOTTOM);
    }
    return null;
  }
  onOtpCodeChanged({required String pin,required BuildContext context}){
    update();
   otpCode =
       otp5.text +
           otp4.text +
            otp3.text +
            otp2.text+otp1.text;
    if(otpCode.length==5){
      FocusScope.of(context).unfocus();
    }else {
      if (pin.length == 1) {
        FocusScope.of(context).previousFocus();
      }
    }
  }
}
