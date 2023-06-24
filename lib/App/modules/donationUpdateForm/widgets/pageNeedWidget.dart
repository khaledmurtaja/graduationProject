// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../core/utils/helperFunctions.dart';
import '../../../widgets/customButtonWidget.dart';
import '../../../widgets/customDropdownButton.dart';
import '../../../widgets/customTextFormField.dart';
import '../../donationRecord/controller.dart';
import '../controller.dart';

class PageNeedUpdateidget extends StatelessWidget {
  DonationUpdateFormScreenController controller;
  PageNeedUpdateidget({
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
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
          prefixIcon: const Icon(Icons.person),
          validator: validateNameField,
          focusNode: controller.nameOfNeedFocusNode,
          onFieldSubmitted: () {
            controller.phoneOfNeedFocusNode.requestFocus();
          },
          maxLength: 30,
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
          prefixIcon: const Icon(Icons.phone),
          focusNode: controller.phoneOfNeedFocusNode,
          onFieldSubmitted: () {
            controller.detailsOfNeedFocusNode.requestFocus();
          },
          maxLength: 10,
          validator: validatePhoneNumber,
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
                    iconPath: "assets/images/icons/drop.svg",
                    textStyle: TextStyle(
                      fontSize: 20.spMin,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    data: controller.bloodUnits,
                    defaultValue: controller.needyBloodUnitDefaultValue,
                    onChange: (value) {
                      controller.onChangeNeedyBloodUnit(bloodUnit: value);
                    },
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
                    iconPath: "assets/images/icons/home.svg",
                    textStyle: TextStyle(
                      fontSize: 20.spMin,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    data: controller.city,
                    defaultValue: controller.needyLocationDefaultValue,
                    onChange: (value) {
                      controller.onChangeNeedyCity(city: value);
                    },
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
          validator: validateDetailsField,
          focusNode: controller.detailsOfNeedFocusNode,
          onFieldSubmitted: () {},
          isPassword: false,
          maxLength: 150,
          maxLines: null,
          // textInputType: TextInputType.multiline,
          width: getMediaQueryWidth(context: context, value: 327),
          height: getMediaQueryHeight(context: context, value: 133),
        ),
        SizedBox(
          height: getMediaQueryHeight(context: context, value: 45),
        ),
        Center(
          child: GetBuilder(
            builder: (DonationUpdateFormScreenController controller) {
              if (controller.isLoading) {
                return const CircularProgressIndicator();
              } else {
                return CustomButton(
                  onPressed: () async {
                    bool isFormValidated =
                        controller.formKey.currentState!.validate();
                    if (isFormValidated) {
                      final donationRecordController = Get.find<DonationRecordScreenController>();
                      if (controller.donorChoice) {
                        await controller.updateOffer(offerId:  donationRecordController.donationOfferModel.operationId!);
                      } else {
                        await controller.updateAppeal(appealId:donationRecordController.donationAppealModel.operationId! );
                      }
                    }
                  },
                  text: 'مشاركة',
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
