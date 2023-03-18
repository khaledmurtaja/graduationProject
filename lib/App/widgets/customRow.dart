// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/helperFunctions.dart';

class CustomRow extends StatelessWidget {
  String firstText;
  String secondText;
  FontWeight firstTextFontWeight;
  double secondTextFontSize;
  CustomRow({
    Key? key,
    required this.firstText,
    required this.secondText,
    required this.firstTextFontWeight,
    required this.secondTextFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          firstText,
          style: TextStyle(
            fontSize: 16.spMin,
            fontWeight: firstTextFontWeight,
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: getMediaQueryWidth(context: context, value: 8),
        ),
        Expanded(
          child: Text(
            secondText,
            style: TextStyle(
              fontSize: secondTextFontSize,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
