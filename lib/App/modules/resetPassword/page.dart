import 'package:blood4life/App/modules/resetPassword/controller.dart';
import 'package:blood4life/App/widgets/customButtonWidget.dart';
import 'package:blood4life/core/utils/helperFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/values/colors.dart';
import '../../widgets/customAppBar.dart';
import '../../widgets/customTextFormField.dart';

class ResetPasswordScreen extends GetView<ResetPasswordScreenController> {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        function: () {},
        title: 'إعادة تعين كلمة المرور',
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            left: getMediaQueryWidth(context: context, value: 24),
            right: getMediaQueryWidth(context: context, value: 24),
            top: getMediaQueryHeight(context: context, value: 16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "كلمة المرور القديمة",
                style:
                    TextStyle(fontSize: 16.spMin, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: getMediaQueryHeight(context: context, value: 14),
              ),
              CustomFormField(
                controller: controller.oldPasswordController,
                prefixIcon: const Icon(Icons.lock),
                validator: validateEmail,
                hint: '********',
                isPassword: true,
                width: getMediaQueryWidth(context: context, value: 327),
                suffixIcon: IconButton(
                  icon: Icon(controller.securePassword
                      ? Icons.remove_red_eye
                      : Icons.visibility_off),
                  onPressed: () {
                    controller.onRedEyeClicked();
                  },
                ),
              ),
              SizedBox(
                height: getMediaQueryHeight(context: context, value: 16),
              ),
              Text(
                "كلمة المرور الجديدة",
                style:
                    TextStyle(fontSize: 16.spMin, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: getMediaQueryHeight(context: context, value: 14),
              ),
              CustomFormField(
                controller: controller.newPasswordController,
                prefixIcon: const Icon(Icons.lock),
                validator: validateEmail,
                hint: '********',
                isPassword: true,
                width: getMediaQueryWidth(context: context, value: 327),
                suffixIcon: IconButton(
                  icon: Icon(controller.securePassword
                      ? Icons.remove_red_eye
                      : Icons.visibility_off),
                  onPressed: () {
                    controller.onRedEyeClicked();
                  },
                ),
              ),
              SizedBox(
                height: getMediaQueryHeight(context: context, value: 16),
              ),
              Text(
                "تأكيد كلمة المرور الجديدة",
                style:
                    TextStyle(fontSize: 16.spMin, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: getMediaQueryHeight(context: context, value: 14),
              ),
              CustomFormField(
                controller: controller.confirmNewPasswordController,
                prefixIcon: const Icon(Icons.lock),
                validator: validateEmail,
                hint: '********',
                isPassword: true,
                width: getMediaQueryWidth(context: context, value: 327),
                suffixIcon: IconButton(
                  icon: Icon(controller.securePassword
                      ? Icons.remove_red_eye
                      : Icons.visibility_off),
                  onPressed: () {
                    controller.onRedEyeClicked();
                  },
                ),
              ),
              SizedBox(
                height: getMediaQueryHeight(context: context, value: 120),
              ),
              CustomButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            content: Padding(
                          padding: EdgeInsets.only(
                            left:
                                getMediaQueryWidth(context: context, value: 50),
                            right:
                                getMediaQueryWidth(context: context, value: 50),
                            top: getMediaQueryHeight(
                                context: context, value: 24),
                            bottom: getMediaQueryHeight(
                                context: context, value: 28),
                          ),
                          child: Column(
                                mainAxisSize: MainAxisSize.min,

                            children: [
                              SvgPicture.asset(
                                "assets/images/icons/verifySuccessfully.svg",
                              ),
                              SizedBox(
                                height: getMediaQueryHeight(
                                    context: context, value: 16),
                              ),
                              Text(
                                'تم تغير كلمة السر بنجاح',
                                style: TextStyle(
                                    fontSize: 16.spMin,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: getMediaQueryHeight(
                                    context: context, value: 40),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: verifyBtnColor),
                                  width: getMediaQueryWidth(
                                      context: context, value: 207),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15,
                                          bottom: 15,
                                          left: 12,
                                          right: 12),
                                      child: Text(
                                        'عودة الى الصفحة الرئيسية',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.spMin),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ));
                      });
                },
                text: 'حفظ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
