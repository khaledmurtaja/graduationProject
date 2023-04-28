import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/helperFunctions.dart';

class SingleErrorTextWidget extends StatelessWidget {
  String errorMessage;
  double height;
  SingleErrorTextWidget({
    Key? key,
    required this.errorMessage,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getMediaQueryHeight(context: context, value: height),
      child: Center(
        child: Text(
          errorMessage,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.spMin),
        ),
      ),
    );
  }
}
