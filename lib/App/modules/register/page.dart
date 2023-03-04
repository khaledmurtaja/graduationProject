import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/customButtonWidget.dart';
import '../../widgets/customTextBtnWidget.dart';
import '../../widgets/customTextFormField.dart';
import '../login/page.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.h),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
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
                SizedBox(
                  width: deviceWidth* 0.87,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "الإسم الاول",
                              style: TextStyle(
                                  fontSize: 16.spMin, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: deviceHeight * 0.009,
                            ),
                            CustomFormField(
                              prefixIcon: Icon(Icons.person),
                              validator: () {},
                              hint: 'الإسم كامل',
                              isPassword: false,
                              width: deviceWidth * 0.87,
                            ),

                          ],
                        ),
                      ),
                      SizedBox(width: 32.w,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "الإسم الاخير",
                              style: TextStyle(
                                  fontSize: 16.spMin, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: deviceHeight * 0.009,
                            ),
                            CustomFormField(
                              prefixIcon: Icon(Icons.person),
                              validator: () {},
                              hint: 'الإسم الاخير',
                              isPassword: false,
                              width: deviceWidth * 0.87,
                            ),

                          ],
                        ),
                      ),

                    ],

                  ),
                ) ,
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
                  prefixIcon: Icon(Icons.email),
                  validator: () {},
                  hint: 'email@gmail.com',
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
                CustomFormField(
                  prefixIcon: const Icon(Icons.lock),
                  validator: () {},
                  hint: '********',
                  isPassword: true,
                  width: deviceWidth * 0.87,
                  suffixIcon: const Icon(Icons.remove_red_eye),
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
                CustomFormField(
                  prefixIcon: const Icon(Icons.lock),
                  validator: () {},
                  hint: '********',
                  isPassword: true,
                  width: deviceWidth * 0.87,
                  suffixIcon: const Icon(Icons.remove_red_eye),
                ),
                SizedBox(
                  height: deviceHeight * 0.04,
                ),
                CustomButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  text: 'إنشاء حساب',
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
                    CustomTextButton(text: 'تسجيل الدخول', function: () {}),
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
