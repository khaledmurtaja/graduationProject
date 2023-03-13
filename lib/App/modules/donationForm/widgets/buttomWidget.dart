// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/helperFunctions.dart';
import '../../../../core/values/colors.dart';
import '../controller.dart';

class ButtonWidget extends StatelessWidget {
  String buttonText;
  String direction;
  bool IsChosen;

  final VoidCallback function;

  ButtonWidget({
    required this.buttonText,
    required this.direction,
    required this.IsChosen,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: getMediaQueryWidth(context: context, value: 38),
        margin: direction == 'Right'
            ? EdgeInsets.only(
                right: getMediaQueryWidth(context: context, value: 8))
            : EdgeInsets.only(
                left: getMediaQueryWidth(context: context, value: 8)),
        decoration: BoxDecoration(
          borderRadius: direction == 'Right'
              ? const BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
          color: IsChosen ? primaryColor : iconPrimaryColor,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 16.spMin,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
