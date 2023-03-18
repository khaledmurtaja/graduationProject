import 'package:blood4life/App/widgets/customRow.dart';
import 'package:blood4life/core/utils/helperFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/values/colors.dart';
import '../../widgets/customAppBar.dart';
import '../../widgets/customButtonWidget.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        function: () {},
        title: 'معلوماتي الشخصية',
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: getMediaQueryWidth(context: context, value: 24),
          right: getMediaQueryWidth(context: context, value: 24),
          top: getMediaQueryWidth(context: context, value: 16),
        ),
        child: Center(
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
                height: getMediaQueryHeight(context: context, value: 16),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'تعديل الملف',
                  style: TextStyle(
                    fontSize: 16.spMin,
                    fontWeight: FontWeight.w500,
                    color: editBtnColor,
                  ),
                ),
              ),
              SizedBox(
                height: getMediaQueryHeight(context: context, value: 27),
              ),
              CustomRow(
                firstText: 'الاسم بالكامل : ',
                secondText: 'يوسف هاني المصري',
                firstTextFontWeight: FontWeight.w500,
                secondTextFontSize: 12.spMin,
              ),
              SizedBox(
                height: getMediaQueryHeight(context: context, value: 18),
              ),
              CustomRow(
                firstText: 'البريد الإلكتروني : ',
                secondText: 'yousefalmassri3@gmail.com',
                firstTextFontWeight: FontWeight.w500,
                secondTextFontSize: 12.spMin,
              ),
              SizedBox(
                height: getMediaQueryHeight(context: context, value: 18),
              ),
              CustomRow(
                firstText: 'رقم التواصل :',
                secondText: '0597589865',
                firstTextFontWeight: FontWeight.w500,
                secondTextFontSize: 12.spMin,
              ),
              SizedBox(
                height: getMediaQueryHeight(context: context, value: 18),
              ),
              CustomRow(
                firstText: 'مكان السكن :',
                secondText: 'المغازي',
                firstTextFontWeight: FontWeight.w500,
                secondTextFontSize: 12.spMin,
              ),
              SizedBox(
                height: getMediaQueryHeight(context: context, value: 18),
              ),
              CustomRow(
                firstText: 'فصيلة الدم :',
                secondText: 'O+',
                firstTextFontWeight: FontWeight.w500,
                secondTextFontSize: 12.spMin,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
