import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingTextWidget extends StatelessWidget {
  String landingText;
  double fontSize;
  LandingTextWidget({super.key, required this.landingText,this.fontSize=20, });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.70,
      child: Text(
        landingText,
        style: TextStyle( fontSize: fontSize.spMin,fontWeight: FontWeight.w700),
        textAlign: TextAlign.center,
      ),
    );
  }

}
