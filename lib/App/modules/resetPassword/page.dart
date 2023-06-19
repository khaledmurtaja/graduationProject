import 'package:blood4life/App/modules/resetPassword/controller.dart';
import 'package:blood4life/App/widgets/customButtonWidget.dart';
import 'package:blood4life/core/utils/helperFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/values/consts.dart';
import '../../widgets/customAppBar.dart';
import '../../widgets/customTextFormField.dart';
import '../home/controller.dart';

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
        reverse: true,
        child: Padding(
          padding: EdgeInsets.only(
            left: getMediaQueryWidth(context: context, value: 24),
            right: getMediaQueryWidth(context: context, value: 24),
            top: getMediaQueryHeight(context: context, value: 16),
          ),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "كلمة المرور القديمة",
                  style: TextStyle(
                      fontSize: 16.spMin, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: getMediaQueryHeight(context: context, value: 14),
                ),
                GetBuilder<ResetPasswordScreenController>(
                  builder: (controller) {
                    return CustomFormField(
                      controller: controller.oldPasswordController,
                      prefixIcon: const Icon(Icons.lock),
                      validator: validatePasswordLogin,
                      hint: '********',
                      isPassword: controller.isOldPasswordSecured,
                      width: getMediaQueryWidth(context: context, value: 327),
                      suffixIcon: IconButton(
                        icon: Icon(controller.isOldPasswordSecured
                            ? Icons.remove_red_eye
                            : Icons.visibility_off),
                        onPressed: () {
                          controller.onRedEyeOldPasswordClicked();
                        },
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: getMediaQueryHeight(context: context, value: 16),
                ),
                Text(
                  "كلمة المرور الجديدة",
                  style: TextStyle(
                      fontSize: 16.spMin, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: getMediaQueryHeight(context: context, value: 14),
                ),
                GetBuilder<ResetPasswordScreenController>(
                  builder: (controller) {
                    return CustomFormField(
                      controller: controller.newPasswordController,
                      passwordConfirmController:
                          controller.confirmNewPasswordController,
                      prefixIcon: const Icon(Icons.lock),
                      validator: validatePasswordRegister,
                      hint: '********',
                      isPassword: controller.isNewPasswordSecured,
                      width: getMediaQueryWidth(context: context, value: 327),
                      suffixIcon: IconButton(
                        icon: Icon(controller.isNewPasswordSecured
                            ? Icons.remove_red_eye
                            : Icons.visibility_off),
                        onPressed: () {
                          controller.onRedEyeNewPasswordClicked();
                        },
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: getMediaQueryHeight(context: context, value: 16),
                ),
                Text(
                  "تأكيد كلمة المرور الجديدة",
                  style: TextStyle(
                      fontSize: 16.spMin, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: getMediaQueryHeight(context: context, value: 14),
                ),
                GetBuilder<ResetPasswordScreenController>(
                  builder: (controller) {
                    return CustomFormField(
                      controller: controller.confirmNewPasswordController,
                      passwordConfirmController:
                          controller.newPasswordController,
                      prefixIcon: const Icon(Icons.lock),
                      validator: validatePasswordRegister,
                      hint: '********',
                      isPassword: controller.isNewPasswordConfirmationSecured,
                      width: getMediaQueryWidth(context: context, value: 327),
                      suffixIcon: IconButton(
                        icon: Icon(controller.isNewPasswordConfirmationSecured
                            ? Icons.remove_red_eye
                            : Icons.visibility_off),
                        onPressed: () {
                          controller.onRedEyeNewPasswordConfirmationClicked();
                        },
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: getMediaQueryHeight(context: context, value: 120),
                ),
                GetBuilder<ResetPasswordScreenController>(
                  builder: (controller) {
                    if (controller.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return CustomButton(
                        onPressed: () async {
                          if (controller.formKey.currentState!.validate()) {
                            await controller.resetPassword();
                            if (context.mounted &&
                                controller.passwordResetSuccessfully) {
                              showDialog(
                                  context: context,
                                  builder: (c) {
                                    return showSuccessResetPasswordMessage(
                                        context: context,
                                        goToHomeFun: () {
                                          final homeController =
                                              Get.find<HomeScreenController>();
                                          homeController.changeCurrentPageIndex(
                                              homePageIndex);
                                        });
                                  });
                            }
                          }
                        },
                        text: 'حفظ',
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
