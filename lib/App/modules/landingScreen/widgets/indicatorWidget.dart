import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/values/colors.dart';

class IndicatorWidget extends StatelessWidget {
  PageController controller;
  IndicatorWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
        controller: controller,
        count: 3,
        effect: ExpandingDotsEffect(
            dotHeight: 10.h,
            dotWidth: 10.w,
            activeDotColor: primaryColor,
            dotColor: inActiveDotsColor),
        onDotClicked: (index) {});
  }
}
