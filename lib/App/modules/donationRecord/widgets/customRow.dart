// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/helperFunctions.dart';

class CustomRow extends StatelessWidget {
  String firstText;
  String secondText;
  CustomRow({
    Key? key,
    required this.firstText,
    required this.secondText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          firstText,
          style: TextStyle(
            fontSize: 12.spMin,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: getMediaQueryWidth(context: context, value: 4),
        ),
        Text(
          secondText,
          style: TextStyle(
            fontSize: 12.spMin,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
