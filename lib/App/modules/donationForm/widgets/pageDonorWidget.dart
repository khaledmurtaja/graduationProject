// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/utils/helperFunctions.dart';
import '../../../../core/values/colors.dart';
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
    return Column(
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
          prefixIcon: const Icon(Icons.person),
          validator: validateNameField,
          focusNode: controller.nameOfDonorFocusNode,
          onFieldSubmitted: () {
            controller.phoneOfDonorFocusNode.requestFocus();
          },
          hint: 'اسم المتبرع بالكامل',
          isPassword: false,
          maxLength: 30,
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
          prefixIcon: const Icon(Icons.phone),
          focusNode: controller.phoneOfDonorFocusNode,
          validator: validatePhoneNumber,
          hint: 'مثال 0597000000',
          onFieldSubmitted: () {
            controller.idOfDonorFocusNode.requestFocus();
          },
          maxLength: 10,
          isPassword: false,
          textInputType: TextInputType.phone,
          width: getMediaQueryWidth(context: context, value: 327),
        ),
        SizedBox(
          height: getMediaQueryHeight(context: context, value: 16),
        ),
        Text(
          "رقم هوية المتبرع",
          style: TextStyle(fontSize: 16.spMin, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: getMediaQueryHeight(context: context, value: 8),
        ),
        CustomFormField(
          controller: controller.idOfDonorController,
          prefixIcon: const Icon(Icons.credit_card),
          onFieldSubmitted: () {},
          validator: validateIdNumber,
          focusNode: controller.idOfDonorFocusNode,
          maxLength: 9,
          hint: 'مثال 4059996772',
          isPassword: false,
          textInputType: TextInputType.number,
          width: getMediaQueryWidth(context: context, value: 327),
        ),
        SizedBox(
          height: getMediaQueryHeight(context: context, value: 8),
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
                  GetBuilder(
                    builder: (DonationFormScreenController controller) {
                      return CustomDropdownButton(
                        iconPath: "assets/images/icons/calendar1.svg",
                        onChange: (value) {
                          controller.onChangeDonorAge(age: value);
                        },
                        textStyle: TextStyle(
                          fontSize: 20.spMin,
                          color: editBtnColor,
                          fontWeight: FontWeight.w500,
                        ),
                        data: List.generate(
                            49, (index) => (index + 17).toString()),
                      );
                    },
                  ),
                  SizedBox(
                      height: getMediaQueryHeight(context: context, value: 16)),
                  Text(
                    "فصيلة الدم",
                    style: TextStyle(
                        fontSize: 16.spMin, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: getMediaQueryHeight(context: context, value: 8),
                  ),
                  GetBuilder(
                    builder: (DonationFormScreenController controller) {
                      return CustomDropdownButton(
                        iconPath: "assets/images/icons/drop.svg",
                        onChange: (value) {
                          controller.onChangeDonorBloodUnit(bloodUnit: value);
                        },
                        textStyle: TextStyle(
                          fontSize: 20.spMin,
                          color: editBtnColor,
                          fontWeight: FontWeight.w500,
                        ),
                        data: controller.bloodUnits,
                      );
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
                    "الوزن",
                    style: TextStyle(
                        fontSize: 16.spMin, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: getMediaQueryHeight(context: context, value: 8),
                  ),
                  GetBuilder(
                    builder: (DonationFormScreenController controller) {
                      return CustomDropdownButton(
                        onChange: (value) {
                          controller.onchangeDonorWeight(weight: value);
                        },
                        iconPath: "assets/images/icons/weightmeter.svg",
                        textStyle: TextStyle(
                          fontSize: 20.sp,
                          color: editBtnColor,
                          fontWeight: FontWeight.w500,
                        ),
                        data: List.generate(
                            99, (index) => (index + 60).toString()),
                      );
                    },
                  ),
                  SizedBox(
                      height: getMediaQueryHeight(context: context, value: 16)),
                  Text(
                    "مكان السكن",
                    style: TextStyle(
                        fontSize: 16.spMin, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: getMediaQueryHeight(context: context, value: 8),
                  ),
                  GetBuilder(
                    builder: (DonationFormScreenController controller) {
                      return CustomDropdownButton(
                        iconPath: "assets/images/icons/home.svg",
                        onChange: (value) {
                          controller.onChangeDonorCity(city: value);
                        },
                        textStyle: TextStyle(
                          fontSize: 16.spMin,
                          color: editBtnColor,
                          fontWeight: FontWeight.w500,
                        ),
                        data: controller.city,
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: getMediaQueryHeight(context: context, value: 65),
        ),
        Center(
          child: GetBuilder(
            builder: (DonationFormScreenController controller) {
              if (controller.isLoading) {
                return const CircularProgressIndicator();
              } else {
                return CustomButton(
                  onPressed: () async {
                    bool isFormValidated =
                        controller.formKey.currentState!.validate();
                    if (isFormValidated) {
                      if(controller.donorChoice){
                        await controller.shareOffer();
                      }else{
                        await controller.shareAppeal();

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
