import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/helperFunctions.dart';
import '../../../../core/values/colors.dart';
import '../../../widgets/customRow.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: textFormFieldColor,
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.only(
            top: getMediaQueryHeight(context: context, value: 8),
            bottom: getMediaQueryHeight(context: context, value: 8),
            right: getMediaQueryWidth(context: context, value: 8)),
        child: Column(
          children: [
            CustomRow(
              firstText: 'رقم العملية :',
              secondText: '#10243',
              firstTextFontWeight: FontWeight.w500,
              secondTextFontSize: 12.spMin,
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 8),
            ),
            CustomRow(
              firstText: 'المتبرع له (المحتاج) :',
              secondText: 'ابراهيم خليل كذا',
              firstTextFontWeight: FontWeight.w500,
              secondTextFontSize: 12.spMin,
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 8),
            ),
            CustomRow(
              firstText: 'تاريخ عملية التبرع :',
              secondText: '08/03/2023',
              firstTextFontWeight: FontWeight.w500,
              secondTextFontSize: 12.spMin,
            ),
          ],
        ),
      ),
    );
  }
}
