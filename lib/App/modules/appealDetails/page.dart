import 'dart:io';

import 'package:blood4life/App/modules/appealDetails/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/utils/helperFunctions.dart';
import '../../../core/values/colors.dart';
import '../../widgets/customAppBar.dart';
import '../../widgets/customButtonWidget.dart';
import '../../widgets/customRow.dart';

class AppealDetailsScreen extends GetView<AppealDetailsScreenController> {
  const AppealDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        function: () {
          Get.back();
        },
        title: 'مناشدة',
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: getMediaQueryWidth(context: context, value: 24),
          right: getMediaQueryWidth(context: context, value: 24),
          top: getMediaQueryWidth(context: context, value: 16),
        ),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              color: textFormFieldColor,
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.only(
                    left: getMediaQueryWidth(context: context, value: 16),
                    right: getMediaQueryWidth(context: context, value: 16),
                    top: getMediaQueryWidth(context: context, value: 16),
                    bottom: getMediaQueryHeight(context: context, value: 16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            "assets/images/test/young-bearded-man-with-striped-shirt.jpg",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getMediaQueryHeight(context: context, value: 24),
                    ),
                    Text(
                      'يوسف هاني المصري',
                      style: TextStyle(
                        fontSize: 16.spMin,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: getMediaQueryHeight(context: context, value: 24),
                    ),
                    CustomRow(
                      firstText: 'إسم المحتاج :',
                      secondText: controller.donationAppealModel!.fullName,
                      firstTextFontWeight: FontWeight.w700,
                      secondTextFontSize: 16.spMin,
                    ),
                    SizedBox(
                      height: getMediaQueryHeight(context: context, value: 16),
                    ),
                    CustomRow(
                      firstText: 'رقم التواصل :',
                      secondText: controller.donationAppealModel!.phoneNumber,
                      firstTextFontWeight: FontWeight.w700,
                      secondTextFontSize: 16.spMin,
                    ),
                    SizedBox(
                      height: getMediaQueryHeight(context: context, value: 16),
                    ),
                    CustomRow(
                      firstText: 'فصيلة الدم : ',
                      secondText: controller.donationAppealModel!.bloodType,
                      firstTextFontWeight: FontWeight.w700,
                      secondTextFontSize: 16.spMin,
                    ),
                    SizedBox(
                      height: getMediaQueryHeight(context: context, value: 16),
                    ),
                    CustomRow(
                      firstText: 'مكان السكن :',
                      secondText: controller.donationAppealModel!.location,
                      firstTextFontWeight: FontWeight.w700,
                      secondTextFontSize: 16.spMin,
                    ),
                    SizedBox(
                      height: getMediaQueryHeight(context: context, value: 16),
                    ),
                    CustomRow(
                      firstText: 'التفاصيل :',
                      secondText: controller.donationAppealModel!.description,
                      firstTextFontWeight: FontWeight.w700,
                      secondTextFontSize: 16.spMin,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 32),
            ),
            Row(
              children: [
                CustomButton(
                  onPressed: () async {
                    await makePhoneCall(
                        controller.donationAppealModel!.phoneNumber);
                  },
                  text: 'اتصل الآن',
                  width: getMediaQueryWidth(
                    context: context,
                    value: 271,
                  ),
                  textBtnFontWeight: FontWeight.w700,
                ),
                SizedBox(
                  width: getMediaQueryWidth(context: context, value: 8),
                ),
                CustomButton(
                  onPressed: () async {
                    await controller.shareAppeal(
                        appealDetailsScreenController: controller);
                  },
                  text: 'ايقونه',
                  showIcon: true,
                  width: getMediaQueryWidth(
                    context: context,
                    value: 48,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
