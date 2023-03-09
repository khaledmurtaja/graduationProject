// ignore_for_file: sort_child_properties_last

import 'package:blood4life/App/modules/donationRequest/controller.dart';
import 'package:blood4life/App/modules/donationRequest/widgets/buttomWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:math' as math; // import this

import '../../../core/utils/helperFunctions.dart';
import '../../../core/values/colors.dart';
import '../../widgets/customTextFormField.dart';

class DonationRequestScreen extends GetView<DonationRequestScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: getMediaQueryHeight(context: context, value: 60),
          left: getMediaQueryWidth(context: context, value: 24),
          right: getMediaQueryWidth(context: context, value: 24),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                    color: iconArrowBackBackgroundColor,
                  ),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: const Icon(
                      Icons.arrow_back_ios_new_sharp,
                      size: 20,
                    ),
                  ),
                  alignment: Alignment.center,
                ),
                SizedBox(
                  width: getMediaQueryWidth(context: context, value: 8),
                ),
                Text(
                  "إنشاء طلب تبرع",
                  style: TextStyle(
                      fontSize: 20.spMin, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 16),
            ),
            Container(
              width: getMediaQueryWidth(context: context, value: 327),
              height: getMediaQueryWidth(context: context, value: 48),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
                color: iconArrowBackBackgroundColor,
              ),
              child: GetBuilder<DonationRequestScreenController>(
                  builder: (DonationRequestScreenController controller) {
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: ButtonWidget(
                        direction: 'Right',
                        buttonText: 'محتاج',
                        IsChosen: controller.needChoice,
                        controller: controller,
                      ),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: ButtonWidget(
                        direction: 'Left',
                        buttonText: 'متبرع',
                        IsChosen: controller.donorChoice,
                        controller: controller,
                      ),
                    ),
                  ],
                );
              }),
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 32),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "إسم المحتاج",
                      style: TextStyle(
                          fontSize: 16.spMin, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: getMediaQueryHeight(context: context, value: 8),
                    ),
                    CustomFormField(
                      controller: controller.nameOfTheNeedyController,
                      prefixIcon: Icon(Icons.person),
                      validator: () {},
                      hint: 'اسم المحتاج بالكامل',
                      isPassword: false,
                      width: getMediaQueryWidth(context: context, value: 327),
                    ),
                    SizedBox(
                      height: getMediaQueryHeight(context: context, value: 16),
                    ),
                    Text(
                      "رقم التواصل",
                      style: TextStyle(
                          fontSize: 16.spMin, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: getMediaQueryHeight(context: context, value: 8),
                    ),
                    CustomFormField(
                      controller: controller.nameOfTheNeedyController,
                      prefixIcon: Icon(Icons.person),
                      validator: () {},
                      hint: 'مثال 0597000000',
                      isPassword: false,
                      width: getMediaQueryWidth(context: context, value: 327),
                    ),
                    SizedBox(
                      height: getMediaQueryHeight(context: context, value: 16),
                    ),

                    
                    Text(
                      "رقم التواصل",
                      style: TextStyle(
                          fontSize: 16.spMin, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: getMediaQueryHeight(context: context, value: 8),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
