// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/helperFunctions.dart';
import '../../core/values/colors.dart';

class CustomAppBar extends StatelessWidget {
  String title;
  final VoidCallback function;

  CustomAppBar({
    required this.title,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: function,
          child: Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
              color: textFormFieldColor,
            ),
            child: SvgPicture.asset(
              "assets/images/icons/turnBack.svg",
            ),
            alignment: Alignment.center,
          ),
        ),
        SizedBox(
          width: getMediaQueryWidth(context: context, value: 8),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 20.spMin, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
