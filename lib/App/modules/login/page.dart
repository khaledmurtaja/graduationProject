import 'package:blood4life/App/widgets/customTextBtnWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/customButtonWidget.dart';
import '../../widgets/customTextFormField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 24, left: 24),
          child: SizedBox(
            width: double.infinity,
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
                  prefixIcon: Icon(Icons.email),
                  validator: () {},
                  hint: 'example@gmail.com',
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
                CustomFormField(
                  prefixIcon: const Icon(Icons.lock),
                  validator: () {},
                  hint: '********',
                  isPassword: true,
                  width: deviceWidth * 0.87,
                  suffixIcon: const Icon(Icons.remove_red_eye),
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
                CustomButton(
                  onPressed: () {},
                  text: 'تسجيل الدخول',
                ),
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
                    CustomTextButton(text: 'انشاء حساب جديد', function: () {}),
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
    );
  }
}
