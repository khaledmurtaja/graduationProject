import 'package:blood4life/App/modules/EmailVerfication/controller.dart';
import 'package:blood4life/App/widgets/customButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/consts.dart';
import '../../widgets/OtpTextField.dart';

class VerificationEmailScreen extends GetView<EmailVerificationController> {
  const VerificationEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppBar(
            elevation: 0,
            backgroundColor: scaffoldColor,
          )),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            InkWell(
              onTap: () {
                ///back to register screen
              },
              child: Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset(
                        arrowBackIcon,
                        height: 24.h,
                        width: 24.w,
                      ))),
            ),
            SizedBox(
              height: 80.h,
            ),
            Text(
              'أدخل رمز التحقق',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 24.spMin),
            ),
            SizedBox(
              height: 24.h,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                    color: const Color(0xffA0A0A0),
                    fontSize: 18.spMin,
                    fontWeight: FontWeight.w400),
                children:  [
                  const TextSpan(
                    text: 'تم ارسال رمز تحقق مكون من 5 ارقام على\n',
                  ),
                  const TextSpan(text: "بريدك الاكتروني  "),
                  TextSpan(
                    text: controller.userEmail,
                    style: const TextStyle(color: Color(0xff6A94BB)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OtpTextField(
                    controller: controller.otp1,
                    onchange: (pin) {
                      controller.onOtpCodeChanged(pin: pin, context: context);
                    },
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  OtpTextField(
                    controller: controller.otp2,
                    onchange: (pin) {
                      controller.onOtpCodeChanged(pin: pin, context: context);
                    },
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  OtpTextField(
                    controller: controller.otp3,
                    onchange: (pin) {
                      controller.onOtpCodeChanged(pin: pin, context: context);
                    },
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  OtpTextField(
                    controller: controller.otp4,
                    onchange: (pin) {
                      controller.onOtpCodeChanged(pin: pin, context: context);
                    },
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  OtpTextField(
                    controller: controller.otp5,
                    onchange: (pin) {
                      controller.onOtpCodeChanged(pin: pin, context: context);
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            GetBuilder<EmailVerificationController>(
              builder: (controller) {
                if (controller.isCheckOTPLoading) {
                  return const CircularProgressIndicator();
                } else {
                  return controller.otpCode.length==5? CustomButton(
                      onPressed: () {
                        controller.checkOtpCode();
                      },
                      text: "استمرار"):CustomButton(onPressed: (){}, text: "استمرار",buttonColor:primaryColor.withOpacity(0.5),);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
