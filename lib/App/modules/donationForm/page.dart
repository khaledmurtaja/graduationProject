// ignore_for_file: sort_child_properties_last

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:blood4life/App/modules/donationForm/controller.dart';
import 'package:blood4life/App/modules/donationForm/widgets/buttomWidget.dart';
import 'package:blood4life/App/modules/donationForm/widgets/pageDonorWidget.dart';
import 'package:blood4life/App/modules/donationForm/widgets/pageNeedWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../core/utils/helperFunctions.dart';
import '../../../core/values/colors.dart';
import '../../widgets/customAppBar.dart';

class DonationFormScreen extends GetView<DonationFormScreenController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onBackFormDonationForm(context: context,controller: controller);
        return true; // return false to disable back button press
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          function: () {
            onBackFormDonationForm(context: context,controller: controller);
          },
          title: 'إنشاء طلب تبرع',
        ),
        body: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: EdgeInsets.only(
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
                          const VerticalDivider(),
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
          ),
        ),
      ),
    );
  }
}
