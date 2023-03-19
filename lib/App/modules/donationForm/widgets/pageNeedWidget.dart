// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/helperFunctions.dart';
import '../../../../core/values/colors.dart';
import '../../../widgets/customButtonWidget.dart';
import '../../../widgets/customDropdownButton.dart';
import '../../../widgets/customTextFormField.dart';
import '../controller.dart';

class PageNeedWidget extends StatelessWidget {
  DonationFormScreenController controller;
  PageNeedWidget({
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "إسم المحتاج",
              style: TextStyle(fontSize: 16.spMin, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 8),
            ),
            CustomFormField(
              controller: controller.nameOfNeedyController,
              prefixIcon: Icon(Icons.person),
              validator: () {},
              hint: 'اسم المحتاج بالكامل',
              isPassword: false,
              textInputType: TextInputType.text,
              width: getMediaQueryWidth(context: context, value: 327),
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 16),
            ),
            Text(
              "رقم التواصل",
              style: TextStyle(fontSize: 16.spMin, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 8),
            ),
            CustomFormField(
              controller: controller.phoneOfNeedyController,
              prefixIcon: Icon(Icons.phone),
              validator: () {},
              hint: 'مثال 0597000000',
              isPassword: false,
              textInputType: TextInputType.phone,
              width: getMediaQueryWidth(context: context, value: 327),
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 16),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "فصيلة الدم",
                        style: TextStyle(
                            fontSize: 16.spMin, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: getMediaQueryHeight(context: context, value: 8),
                      ),
                      CustomDropdownButton(
                        text: 'O-',
                        textStyle: TextStyle(
                          fontSize: 20.spMin,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        data: [
                          "-O",
                          "-A"
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getMediaQueryWidth(context: context, value: 29),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "مكان السكن",
                        style: TextStyle(
                            fontSize: 16.spMin, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: getMediaQueryHeight(context: context, value: 8),
                      ),
                      CustomDropdownButton(
                        text: 'دير البلح',
                        textStyle: TextStyle(
                          fontSize: 20.spMin,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        data: [

                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 16),
            ),
            Text(
              "التفاصيل (الوصف)",
              style: TextStyle(fontSize: 16.spMin, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 8),
            ),
            CustomFormField(
              controller: controller.detailsOfNeedyController,
              validator: () {},
              isPassword: false,
              textInputType: TextInputType.text,
              width: getMediaQueryWidth(context: context, value: 327),
              height: getMediaQueryHeight(context: context, value: 133),
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 72),
            ),
            CustomButton(
              onPressed: () {},
              text: 'مشاركة',
            ),
          ],
        ),
      ),
    );
  }
}
