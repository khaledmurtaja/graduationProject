import 'package:blood4life/App/modules/connectUs/controller.dart';
import 'package:blood4life/core/utils/helperFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../widgets/customAppBar.dart';
import '../../widgets/customButtonWidget.dart';
import '../../widgets/customTextFormField.dart';

class ConnectUsScreen extends GetView<ConnectUsScreenController> {
  const ConnectUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        function: () {
          Get.back();
        },
        title: 'تواصل معنا',
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: getMediaQueryHeight(context: context, value: 16),
            left: getMediaQueryWidth(context: context, value: 24),
            right: getMediaQueryWidth(context: context, value: 24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'البريد الإالكتروني',
              style: TextStyle(
                fontSize: 16.spMin,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 12),
            ),
            CustomFormField(
              controller: controller.emailController,
              prefixIcon: const Icon(Icons.email),
              validator: validateEmail,
              hint: 'example@gmail.com',
              isPassword: false,
              width: getMediaQueryWidth(context: context, value: 327),
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 16),
            ),
            Text(
              'رسالتك',
              style: TextStyle(
                fontSize: 16.spMin,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 8),
            ),
            // temporary validator
            CustomFormField(
              controller: controller.messageDetailsController,
              validator: validateEmail,
              isPassword: false,
              maxLength: 150,
              maxLines: null,
              hint:
                  'اكتب رسالتك وسيتم التواصل معك والرد على \n استفساراتك في أقرب وقت ',
              width: getMediaQueryWidth(context: context, value: 327),
              height: getMediaQueryHeight(context: context, value: 133),
            ),

            SizedBox(
              height: getMediaQueryHeight(context: context, value: 24),
            ),
            CustomButton(
              onPressed: () {},
              text: 'ارسال',
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 30),
            ),
            Text(
              'أو يمكنك التواصل معنا عبر حساباتنا الرسمية ',
              style: TextStyle(
                fontSize: 16.spMin,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 16),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/icons/facebook.svg",
                  alignment: Alignment.center,
                ),
                SizedBox(
                  width: getMediaQueryWidth(context: context, value: 16),
                ),
                SvgPicture.asset(
                  "assets/images/icons/instagram.svg",
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                ),
                SizedBox(
                  width: getMediaQueryWidth(context: context, value: 16),
                ),
                SvgPicture.asset(
                  "assets/images/icons/twitter.svg",
                  alignment: Alignment.center,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
