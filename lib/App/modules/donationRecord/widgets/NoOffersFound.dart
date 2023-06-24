import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoOffersFound extends StatelessWidget {
  const NoOffersFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset("assets/images/icons/recordEmpty.svg"),
        SizedBox(height: 40.h,),
        Text(
          'لم تقم بنشر اي عروض تبرع بالدم',
          style: TextStyle(
              fontSize: 16.spMin,
              fontWeight: FontWeight.w500
          ),
        )
      ],
    );
  }
}
