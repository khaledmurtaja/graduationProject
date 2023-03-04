import 'package:blood4life/App/modules/landingScreen/widgets/svgPicWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/customButtonWidget.dart';
import '../controller.dart';
import 'indicatorWidget.dart';
import 'landingTextWidget.dart';

class LandingPageOne extends GetView<LandingPageController> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight=MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          SvgPic(picPath: 'assets/images/Insurance-pana.svg',),
          SizedBox(height: deviceHeight*0.019,),
          LandingTextWidget(
            landingText:'التطبيق الاول للتبرع بالدم في قطاع غزة' ,
          ),
          SizedBox(height: deviceHeight*0.078,),
          IndicatorWidget(controller: controller.pageController,),
          SizedBox(height: deviceHeight*0.0688,),
          CustomButton(
            text: 'التالي',
            onPressed: () {},
          )

        ],
      ),
    );
  }
}
