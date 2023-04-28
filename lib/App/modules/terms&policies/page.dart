import 'package:blood4life/App/modules/terms&policies/controller.dart';
import 'package:blood4life/core/utils/helperFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/customAppBar.dart';

class TermsAndPoliciesScreen extends GetView<TermsAndPoliciesScreenController> {
  const TermsAndPoliciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        function: () {
          Get.back();
        },
        title: 'الشروط والسياسات',
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: getMediaQueryHeight(context: context, value: 16),
          bottom: getMediaQueryHeight(context: context, value: 16),
        ),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: controller.termsAndPoliciesText.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                left: getMediaQueryWidth(
                  context: context,
                  value: 24,
                ),
                right: getMediaQueryWidth(
                  context: context,
                  value: 24,
                ),
              ),
              child: Text(
                controller.termsAndPoliciesText[index],
                style: TextStyle(
                  fontSize: 16.spMin,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: getMediaQueryHeight(context: context, value: 20),
            );
          },
        ),
      ),
    );
  }
}
