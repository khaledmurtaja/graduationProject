import 'package:blood4life/App/widgets/customButtonWidget.dart';
import 'package:blood4life/App/widgets/customTextFormField.dart';
import 'package:blood4life/core/utils/helperFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/values/consts.dart';

import 'controller.dart';

class ResetForgottenPasswordScreen
    extends GetView<ResetForgottenPasswordScreenController> {
  const ResetForgottenPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String email = Get.arguments as String;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Row(
          children: [
            SizedBox(width: 24.w,),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(arrowBackIcon),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        reverse: true,
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80.h,
                ),
                Center(
                  child: Text(
                    'انشاء كلمة سر جديدة',
                    style: TextStyle(
                        fontSize: 24.spMin, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: Text(
                    " كلمة السر",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16.spMin),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16.w, left: 16.w),
                  child: CustomFormField(
                    validator: validatePasswordRegister,
                    controller: controller.passwordController,
                    passwordConfirmController:
                        controller.confirmNewPasswordController,
                    isPassword: controller.securePassword,
                    width: 200,
                    hint: "*******",
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: Text(
                    "تأكيد كلمة السر",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16.spMin),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16.w, left: 16.w),
                  child: CustomFormField(
                      hint: "*******",
                      validator: validatePasswordRegister,
                      passwordConfirmController: controller.passwordController,
                      controller: controller.confirmNewPasswordController,
                      isPassword: controller.secureConfirmPassword,
                      width: 200),
                ),
                SizedBox(
                  height: 32.h,
                ),
                GetBuilder<ResetForgottenPasswordScreenController>(
                  builder: (controller) {
                    if (controller.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Center(
                          child: CustomButton(
                              onPressed: () {
                                bool isValidated =
                                    controller.formKey.currentState!.validate();
                                if (isValidated) {
                                  controller.resetPassword(email: email);
                                }
                              },
                              text: "استمرار"));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
