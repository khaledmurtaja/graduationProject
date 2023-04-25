import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/helperFunctions.dart';
import '../../../../core/values/colors.dart';
import '../controller.dart';

class BloodUnit extends StatelessWidget {
  String? bloodUnit;
  DonationAppealScreenController? controller;
  BloodUnit({required this.bloodUnit, required this.controller});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller!.changeSelectedBloodUnit(bloodUnit: bloodUnit!);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: textFormFieldColor,
            border: controller!.selectedBloodUnit == bloodUnit!
                ? Border.all(color: Colors.red)
                : null),
        width: getMediaQueryWidth(context: context, value: 32),
        height: getMediaQueryHeight(context: context, value: 35),
        margin: EdgeInsets.only(
            left: getMediaQueryWidth(context: context, value: 10)),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            bloodUnit!,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.spMin),
          ),
        ),
      ),
    );
  }
}
