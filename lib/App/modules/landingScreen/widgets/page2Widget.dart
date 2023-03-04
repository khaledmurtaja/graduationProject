import 'package:blood4life/App/modules/landingScreen/widgets/svgPicWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../widgets/customButtonWidget.dart';
import '../controller.dart';
import 'indicatorWidget.dart';
import 'landingTextWidget.dart';

class LandingPageTwo extends GetView<LandingPageController> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight=MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          SvgPic(
            picPath: 'assets/images/Blood donation-amico.svg',

          ),
          SizedBox(height: deviceHeight*0.019,),
          LandingTextWidget(
            landingText: 'تبرع بالدم وأنقذحياة شخص',
          ),
          SizedBox(height: 8,),
          LandingTextWidget(
            landingText: 'قال تعالى\n'
                '{وَمَنْ أَحْيَاهَا فَكَأَنَّمَا أَحْيَا النَّاسَ جَمِيعا}',
            fontSize: 16,
          ),
          SizedBox(height: deviceHeight*0.0590),
          IndicatorWidget(
            controller: controller.pageController,
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.059,),
          CustomButton(
            text: 'التالي',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
