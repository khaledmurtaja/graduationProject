import 'package:blood4life/App/modules/landingScreen/widgets/svgPicWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../widgets/customButtonWidget.dart';
import '../controller.dart';
import 'indicatorWidget.dart';
import 'landingTextWidget.dart';

class LandingPageThree extends GetView<LandingPageController> {

  @override
  Widget build(BuildContext context) {
    double deviceHeight=MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          SvgPic(picPath: 'assets/images/Blood donation-rafiki.svg',),
          SizedBox(height: deviceHeight*0.019,),
          LandingTextWidget(
            landingText:'اعثر على فصيلة دمك\n بأسرع وقت وأسهل طريقة' ,
          ),
          SizedBox(height: deviceHeight*0.078,),
          IndicatorWidget(controller: controller.pageController,),
          SizedBox(height: deviceHeight*0.065,),
          CustomButton(
            text: 'التالي',
            onPressed: () {},
          )

        ],
      ),
    );

  }
}
