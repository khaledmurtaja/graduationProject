import 'package:blood4life/App/widgets/customTextBtnWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/utils/helperFunctions.dart';
import '../../../core/values/strings.dart';
import '../../data/services/sharedPrefService.dart';
import '../../widgets/customButtonWidget.dart';
import '../../widgets/customTextFormField.dart';
import 'controller.dart';

class LoginScreen extends GetView<LoginScreenController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          reverse: true,
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: deviceHeight * 0.04),
                    child: Text(
                      "تسجيل الدخول",
                      style: TextStyle(
                          fontSize: 24.spMin, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Align(
                      child: SvgPicture.asset(
                    "assets/images/Sign in-pana.svg",
                    height: deviceHeight * 0.31,
                    alignment: Alignment.center,
                  )),
                  SizedBox(
                    height: deviceHeight * 0.0295,
                  ),
                  Text(
                    "البريد الالكتروني",
                    style: TextStyle(
                        fontSize: 16.spMin, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.01,
                  ),
                  CustomFormField(
                    controller: controller.emailController,
                    prefixIcon: const Icon(Icons.email),
                    validator: validateEmail,
                    hint: 'example@gmail.com',
                    focusNode: controller.emailFocusNode,
                    onFieldSubmitted: (){
                      controller.passwordFocusNode.requestFocus();
                    },
                    isPassword: false,
                    width: deviceWidth * 0.87,
                  ),
                  SizedBox(
                    height: deviceHeight * 0.019,
                  ),
                  Text(
                    " كلمة المرور",
                    style: TextStyle(
                        fontSize: 16.spMin, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.01,
                  ),
                  GetBuilder<LoginScreenController>(
                    builder: (LoginScreenController controller) {
                      return CustomFormField(
                        controller: controller.passwordController,
                        prefixIcon: const Icon(Icons.lock),
                        validator: validatePasswordLogin,
                        hint: '********',
                        onFieldSubmitted: (){},
                        focusNode: controller.passwordFocusNode,
                        isPassword: controller.securePassword,
                        width: deviceWidth * 0.87,
                        suffixIcon: IconButton(
                          icon: Icon(controller.securePassword
                              ? Icons.remove_red_eye
                              : Icons.visibility_off),
                          onPressed: () {
                            controller.onRedEyeClicked();
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: deviceHeight * 0.01,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.87,
                    child: Row(
                      children: [
                        const Spacer(),
                        InkWell(
                            onTap: () {},
                            child: CustomTextButton(
                                text: "هل نسيت كلمة المرور", function: () {})),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.07,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GetBuilder<LoginScreenController>(
                      builder: (LoginScreenController controller){
                        if(controller.isLoading){
                          return const CircularProgressIndicator();
                        }else{
                          return  CustomButton(
                            onPressed: () {
                              bool isFormValidated = _formKey.currentState!.validate();
                              if (isFormValidated) {
                                /// after signing in successfully
                                controller.loginUser(controller: controller);

                              }
                            },
                            text: 'تسجيل الدخول',
                          );
                        }
                      },
                    ),
                  )
                  ,
                  SizedBox(
                    height: deviceHeight * 0.019,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("لا يوجد لديك حساب؟",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff909090),
                              fontWeight: FontWeight.w400)),
                      const SizedBox(
                        width: 4,
                      ),
                      CustomTextButton(
                          text: 'انشاء حساب جديد',
                          function: () {
                            Get.toNamed("/register");
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
