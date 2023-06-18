import 'package:blood4life/App/widgets/customTextFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/utils/helperFunctions.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/consts.dart';
import '../../widgets/customButtonWidget.dart';
import 'controller.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordScreenController> {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
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
              'لقد نسيت كلمة السر',
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
                    color: const Color(0xff414141),
                    fontSize: 18.spMin,
                    fontWeight: FontWeight.w400),
                children: const [
                  TextSpan(
                    text: 'استرجع كلمة سر حسابك بواسطة\n',
                  ),
                  TextSpan(text: "بريدك الاكتروني  "),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 345.w),
              child: CustomFormField(
                  controller: controller.emailController,
                  prefixIcon: const Icon(Icons.email),
                  validator: validateEmail,
                  hint: 'example@gmail.com',
                  onChange: (){
                    controller.emailChanged();
                  },
                  onFieldSubmitted: () {},
                  isPassword: false,
                  width: deviceWidth * 0.87),
            ),
            SizedBox(
              height: 32.h,
            ),
            GetBuilder<ForgetPasswordScreenController>(
              builder: (controller) {
                if (controller.sendingOtpLoading) {
                  return const CircularProgressIndicator();
                } else {
                  return controller.emailController.text.isEmail
                      ? CustomButton(
                          onPressed: () {
                            controller.sendForgetPasswordOtp();
                          },
                          text: "استمرار")
                      : CustomButton(
                          onPressed: () {},
                          text: "استمرار",
                          buttonColor: Colors.red.withOpacity(0.5),
                        );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
