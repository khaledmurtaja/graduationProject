import 'package:blood4life/core/utils/helperFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../widgets/customButtonWidget.dart';
import '../../widgets/customTextBtnWidget.dart';
import '../../widgets/customTextFormField.dart';
import 'controller.dart';

class RegisterScreen extends GetView<RegisterScreenController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(right: 24, left: 24, top: 10),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: deviceHeight * 0.025),
                    child: Text(
                      "إنشاء حساب جديد",
                      style: TextStyle(
                          fontSize: 24.spMin, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Align(
                    child: SvgPicture.asset(
                      "assets/images/signup.svg",
                      height: deviceHeight * 0.21,
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.023,
                  ),
                  Text(
                    "الإسم ",
                    style: TextStyle(
                        fontSize: 16.spMin, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.009,
                  ),
                  CustomFormField(
                    controller: controller.nameController,
                    prefixIcon: const Icon(Icons.person),
                    validator: validateNameField,
                    hint: 'الإسم رباعي',
                    isPassword: false,
                    focusNode: controller.nameFocusNode,
                    onFieldSubmitted: (){
                      controller.emailFocusNode.requestFocus();
                    },
                    width: deviceWidth * 0.87,
                  ),
                  SizedBox(
                    height: deviceHeight * 0.0090,
                  ),
                  Text(
                    "البريد الإالكتروني",
                    style: TextStyle(
                        fontSize: 16.spMin, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.009,
                  ),
                  CustomFormField(
                    controller: controller.emailController,
                    prefixIcon: const Icon(Icons.email),
                    validator: validateEmail,
                    hint: 'email@gmail.com',
                    focusNode: controller.emailFocusNode,
                    onFieldSubmitted: (){
                      controller.passwordFocusNode.requestFocus();
                    },
                    isPassword: false,
                    width: deviceWidth * 0.87,
                  ),
                  SizedBox(
                    height: deviceHeight * 0.0090,
                  ),
                  Text(
                    "كلمة المرور",
                    style: TextStyle(
                        fontSize: 16.spMin, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.009,
                  ),
                  GetBuilder<RegisterScreenController>(
                    builder: (RegisterScreenController controller) {
                      return CustomFormField(
                        controller: controller.passwordController,
                        passwordConfirmController:
                            controller.passwordConfirmController,
                        prefixIcon: const Icon(Icons.lock),
                        validator: validatePasswordRegister,
                        hint: '********',
                        focusNode: controller.passwordFocusNode,
                        onFieldSubmitted: (){
                          controller.passwordConfirmFocusNode.requestFocus();
                        },
                        isPassword: controller.securePasswordField,
                        width: deviceWidth * 0.87,
                        suffixIcon: IconButton(
                          icon: Icon(controller.securePasswordField
                              ? Icons.remove_red_eye
                              : Icons.visibility_off),
                          onPressed: () {
                            controller.onPasswordIconClicked();
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: deviceHeight * 0.0090,
                  ),
                  Text(
                    "تأكيد كلمة المرور",
                    style: TextStyle(
                        fontSize: 16.spMin, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.009,
                  ),
                  GetBuilder<RegisterScreenController>(
                    builder: (RegisterScreenController controller) {
                      return CustomFormField(
                        controller: controller.passwordConfirmController,
                        passwordConfirmController:
                            controller.passwordController,
                        prefixIcon: const Icon(Icons.lock),
                        validator: validatePasswordRegister,
                        onFieldSubmitted: (){},
                        hint: '********',
                        focusNode: controller.passwordConfirmFocusNode,
                        isPassword: controller.securePasswordConfirmField,
                        width: deviceWidth * 0.87,
                        suffixIcon: IconButton(
                          icon: Icon(controller.securePasswordConfirmField
                              ? Icons.remove_red_eye
                              : Icons.visibility_off),
                          onPressed: () {
                            controller.onPasswordConfirmIconClicked();
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: deviceHeight * 0.04,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GetBuilder<RegisterScreenController>(
                      builder: (RegisterScreenController controller) {
                        if (controller.isLoading) {
                          return const CircularProgressIndicator(
                          );
                        } else {
                          return CustomButton(
                            onPressed: () async {
                              bool isFormValidated =
                                  _formKey.currentState!.validate();
                              if (isFormValidated) {
                                controller.registerUser(controller: controller);
                              }
                            },
                            text: 'إنشاء حساب',
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.019,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(" يوجد لديك حساب بالفعل؟",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff909090),
                              fontWeight: FontWeight.w400)),
                      const SizedBox(
                        width: 4,
                      ),
                      CustomTextButton(
                          text: 'تسجيل الدخول',
                          function: () {
                            Get.offAllNamed("/login");
                          }),
                    ],
                  ),
                  SizedBox(
                    height: deviceHeight * 0.0622,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
