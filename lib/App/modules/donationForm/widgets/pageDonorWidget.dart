// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/helperFunctions.dart';
import '../../../widgets/customButtonWidget.dart';
import '../../../widgets/customDropdownButton.dart';
import '../../../widgets/customTextFormField.dart';
import '../controller.dart';

class PageDonorWidget extends StatelessWidget {
  DonationFormScreenController controller;
  PageDonorWidget({
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
              "إسم المتبرع",
              style: TextStyle(fontSize: 16.spMin, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 8),
            ),
            CustomFormField(
              controller: controller.nameOfDonorController,
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
              controller: controller.phoneOfDonorController,
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
                        "العمر",
                        style: TextStyle(
                            fontSize: 16.spMin, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: getMediaQueryHeight(context: context, value: 8),
                      ),
                      CustomDropdownButton(
                        text: '18',
                      ),
                      SizedBox(
                          height:
                              getMediaQueryHeight(context: context, value: 16)),
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
                        "الوزن",
                        style: TextStyle(
                            fontSize: 16.spMin, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: getMediaQueryHeight(context: context, value: 8),
                      ),
                      CustomDropdownButton(
                        text: '63',
                      ),
                      SizedBox(
                          height:
                              getMediaQueryHeight(context: context, value: 16)),
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
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 96),
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
