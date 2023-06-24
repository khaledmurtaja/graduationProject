// ignore_for_file: sort_child_properties_last

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:blood4life/App/modules/donationForm/controller.dart';
import 'package:blood4life/App/modules/donationForm/widgets/buttomWidget.dart';
import 'package:blood4life/App/modules/donationForm/widgets/pageDonorWidget.dart';
import 'package:blood4life/App/modules/donationForm/widgets/pageNeedWidget.dart';
import 'package:blood4life/App/modules/donationUpdateForm/widgets/pageDonorWidget.dart';
import 'package:blood4life/App/modules/donationUpdateForm/widgets/pageNeedWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../core/utils/helperFunctions.dart';
import '../../../core/values/colors.dart';
import '../../widgets/customAppBar.dart';
import 'controller.dart';

class DonationUpdateFormScreen
    extends GetView<DonationUpdateFormScreenController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onBackFormUpdateDonationForm(context: context, controller: controller);
        return true; // return false to disable back button press
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          function: () {
            onBackFormUpdateDonationForm(
                context: context, controller: controller);
          },
          title: 'تحديث سجلات التبرع',
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
                    child: GetBuilder<DonationUpdateFormScreenController>(
                        builder:
                            (DonationUpdateFormScreenController controller) {
                      return Row(
                        children: <Widget>[
                          Expanded(
                            child: ButtonWidget(
                              direction: 'Right',
                              buttonText: 'محتاج',
                              IsChosen: controller.needChoice,
                              function: () {
                                if (controller.donorChoice) {
                                  showSnackBar(
                                      message: "يجب اختيار  مناشدة اولا",
                                      backGroundColor: primaryColor,
                                      snackPosition: SnackPosition.TOP);
                                }
                              },
                            ),
                          ),
                          const VerticalDivider(),
                          Expanded(
                            child: ButtonWidget(
                                direction: 'Left',
                                buttonText: 'متبرع',
                                IsChosen: controller.donorChoice,
                                function: () {
                                  if (controller.needChoice) {
                                    showSnackBar(
                                        message: "يجب اختيار عرض تبرع اولا",
                                        backGroundColor: primaryColor,
                                        snackPosition: SnackPosition.TOP);
                                  }
                                }),
                          ),
                        ],
                      );
                    }),
                  ),
                  SizedBox(
                    height: getMediaQueryHeight(context: context, value: 32),
                  ),
                  GetBuilder<DonationUpdateFormScreenController>(
                    builder: (DonationUpdateFormScreenController controller) {
                      return controller.needChoice
                          ? PageNeedUpdateidget(
                              controller: controller,
                            )
                          : PageDonorUpdateWidget(controller: controller);
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
