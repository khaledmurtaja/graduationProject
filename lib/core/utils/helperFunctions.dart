import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:blood4life/App/modules/donationForm/controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/strings.dart';

/// Construct a color from a hex code string, of the format #RRGGBB.
Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

String? validateEmail(String email) {
  if (email.isEmpty) {
    return emailIsRequiredMessage;
  } else if (!email.isEmail) {
    return wrongEmailFormatMessage;
  } else {
    return null;
  }
}

/// for validating password field in register screen
String? validatePasswordRegister(
    String password, TextEditingController confirmPasswordController) {
  if (password.isEmpty) {
    return passwordIsRequiredMessage;
  } else if (password.length < 8) {
    return lessThan8charMessage;
  } else if (!uppercaseRegex.hasMatch(password)) {
    return atLeast1UpperCaseLetterMessage;
  } else if (!lowercaseRegex.hasMatch(password)) {
    return atLeast1LowerCaseLetterMessage;
  } else if (!numberRegex.hasMatch(password)) {
    return atLeast1NumberMessage;
  } else if (!specialCharRegex.hasMatch(password)) {
    return atLeast1SpecialCharacterMessage;
  } else if (password != confirmPasswordController.text &&
      confirmPasswordController.text.isNotEmpty) {
    return unMatchedPasswordsMessage;
  } else {
    return null;
  }
}

///for validating phone number field
String? validatePhoneNumber(String phoneNumber) {
  if (phoneNumber.isEmpty) {
    return phoneNumberRequiredMessage;
  } else if (!phoneNumberRegex.hasMatch(phoneNumber)) {
    return unValidPhoneNumMessage;
  } else {
    return null;
  }
}
String? validateDetailsField(String details){
  if(details.isEmpty){
    return detailsIsRequiredMessage;
  }else if(details.length<10){
return atLeast10CharForDetailsFieldMessage;
  }else{
    return null;
  }
}
/// for validating password field in login screen
String? validatePasswordLogin(String password) {
  if (password.isEmpty) {
    return passwordIsRequiredMessage;
  } else if (password.length < 8) {
    return lessThan8charMessage;
  } else {
    return null;
  }
}

///for validating description filed
String? validateDescription(String password) {
  if (password.length > 200) {
    return lessThat200CharRequiredMessage;
  } else {
    return null;
  }
}

///for validating name Filed
String? validateNameField(String name) {
  if (name.isEmpty) {
    return nameIsRequiredMessage;
  } else if (name.length < 4) {
    return nameMustHave4LettersAtLeastMessage;
  } else if (name.length > 30) {
    return nameMustHave30LettersAtMostMessage;
  } else {
    return null;
  }
}
///form validation id number field
String? validateIdNumber(String idNumber) {
  if (idNumber.isEmpty) {
    return idIsRequiredMessage;
  } else if (!idNumberRegex.hasMatch(idNumber)) {
    return unValidIdNumber;
  } else {
    return null;
  }
}
///validate dropdown
String? validateDropDown(String? value){
  if(value==null){
    return "الحقل مطلوب";
  }else{
    return null;
  }
}

double getMediaQueryHeight(
    {required BuildContext context, required num value}) {
  var size = MediaQuery.of(context).size;
  //figma height
  double xdHeight = 813;
  double percentage = value / xdHeight;
  return size.height * percentage;
}

double getMediaQueryWidth({required BuildContext context, required num value}) {
  var size = MediaQuery.of(context).size;
  //figma width
  double xdWidth = 375;
  double percentage = value / xdWidth;

  return size.width * percentage;
}

void showSnackBar(
    {required String message,
    String title = "حدث خطأ",
    Color backGroundColor = Colors.red,
    SnackPosition snackPosition = SnackPosition.BOTTOM}) {
  Get.snackbar(
    title,
    message,
    backgroundColor: backGroundColor,
    colorText: Colors.white,
    snackPosition: snackPosition,
    duration: const Duration(milliseconds: 2500),
  );
}

void handleDioError({required DioError error}) {
  if (error.type == DioErrorType.connectionError) {
    showSnackBar(message: "حدثت مشكلة خلال عملية الاتصال بالانترنت");
  } else if (error.type == DioErrorType.connectionTimeout) {
    showSnackBar(message: "اتصالك بالانترنت غير مستقر");
  } else if (error.type == DioErrorType.sendTimeout) {
    showSnackBar(message: "انتهت صلاحية الطلب,تأكد من اتصالك بالانترنت");
  } else {
    showSnackBar(message: "هناك مشكلة, تأكد من اتصالك بالانترنت.",snackPosition: SnackPosition.TOP);
  }
}

Future<bool> isConnectedToNetwork() async {
  bool isConnected = false;
  final connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    isConnected = true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    isConnected = true;
  } else if (connectivityResult == ConnectivityResult.ethernet) {
    isConnected = true;
  } else if (connectivityResult == ConnectivityResult.vpn) {
    isConnected = true;
  } else if (connectivityResult == ConnectivityResult.none) {
    isConnected = false;
  } else {
    isConnected = true;
  }
  return isConnected;
}
closeKeyBoard({required BuildContext context}){
  FocusScope.of(context).unfocus(); // close the keyboard
}
showConfirmationDialogForForms({required BuildContext context}){
  customDialog(
      context: context,
      title: "هل أنت متأكد من أنك تريد تجاهل التغييرات؟",
      btnOkText: "نعم",
      btnCancelText: "الرجوع الى الطلب",
      dialogType: DialogType.warning,
      onDismissCallback: () {},
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        Get.back();
      }).show();
}
onBackFormDonationForm({required DonationFormScreenController controller,required BuildContext context}){
  closeKeyBoard(context: context);
  if(!controller.donorChoice) {
    if (!controller.allNeedFormFieldsIsEmpty) {
      showConfirmationDialogForForms(context: context);
    } else {
      Get.back();
    }
  }else{
    if (!controller.allDonorFormFieldsIsEmpty) {
      showConfirmationDialogForForms(context: context);
    } else {
      Get.back();
    }
  }

}

AwesomeDialog customDialog(
    {required BuildContext context,
     dynamic controller,
    String btnOkText = "تسجيل الدخول",
    String btnCancelText = "تجاهل",
    DialogType dialogType = DialogType.warning,
    required Function onDismissCallback,
    String title = "العملية تحتاج الى تسجيل الدخول",
    required Function btnCancelOnPress,
    required Function btnOkOnPress}) {
  return AwesomeDialog(
    context: context,
    btnOkText: btnOkText,
    btnCancelText: btnCancelText,
    dialogType: dialogType,
    onDismissCallback: (f) {
      onDismissCallback();
    },
    headerAnimationLoop: false,
    reverseBtnOrder: true,
    showCloseIcon: true,
    animType: AnimType.rightSlide,
    title: title,
    desc: '',
    btnCancelOnPress: () {
      btnCancelOnPress();
    },
    btnOkOnPress: () {
      btnOkOnPress();
    },
  );
}
