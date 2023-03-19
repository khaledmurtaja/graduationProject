// ignore_for_file: sort_child_properties_last

import 'package:blood4life/App/modules/donationForm/controller.dart';
import 'package:blood4life/App/modules/donationForm/widgets/buttomWidget.dart';
import 'package:blood4life/App/modules/donationForm/widgets/pageDonorWidget.dart';
import 'package:blood4life/App/modules/donationForm/widgets/pageNeedWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/utils/helperFunctions.dart';
import '../../../core/values/colors.dart';
import '../../widgets/customAppBar.dart';

class DonationFormScreen extends GetView<DonationFormScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        function: () {},
        title: 'إنشاء طلب تبرع',
      ),
      body: Padding(
        padding: EdgeInsets.only(
          // top: getMediaQueryHeight(context: context, value: 60),
          left: getMediaQueryWidth(context: context, value: 24),
          right: getMediaQueryWidth(context: context, value: 24),
        ),
        child: Column(
          children: [
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 8),
            ),
            Container(
              width: getMediaQueryWidth(context: context, value: 327),
              height: getMediaQueryWidth(context: context, value: 48),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
                color: iconPrimaryColor,
              ),
              child: GetBuilder<DonationFormScreenController>(
                  builder: (DonationFormScreenController controller) {
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: ButtonWidget(
                        direction: 'Right',
                        buttonText: 'محتاج',
                        IsChosen: controller.needChoice,
                        function: () => controller.changeSelection(""),
                      ),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: ButtonWidget(
                        direction: 'Left',
                        buttonText: 'متبرع',
                        IsChosen: controller.donorChoice,
                        function: () => controller.changeSelection("donor"),
                      ),
                    ),
                  ],
                );
              }),
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 32),
            ),
            GetBuilder<DonationFormScreenController>(
              builder: (DonationFormScreenController controller) {
                return controller.needChoice
                    ? PageNeedWidget(
                        controller: controller,
                      )
                    : PageDonorWidget(controller: controller);
              },
            ),
          ],
        ),
      ),
    );
  }
}
