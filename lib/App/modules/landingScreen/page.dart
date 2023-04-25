import 'package:blood4life/App/modules/landingScreen/widgets/page1Widget.dart';
import 'package:blood4life/App/modules/landingScreen/widgets/page2Widget.dart';
import 'package:blood4life/App/modules/landingScreen/widgets/page3Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/values/strings.dart';
import '../../data/services/sharedPrefService.dart';
import 'controller.dart';

class LandingScreen extends GetView<LandingPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Align(
          alignment: AlignmentDirectional.topEnd,
          child: InkWell(
            onTap: (){
              final sharedPref=Get.find<AppSharedPref>();
              sharedPref.putBoolValue(key: landingPageKey, value: true);
              Get.offAndToNamed("/home");

            },
            child: Text(
              "تخطي",
              style: TextStyle(color: Colors.black, fontSize: 16.spMin,),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: PageView(
        controller: controller.pageController,
        children: [
          LandingPageOne(),
          LandingPageTwo(),
          LandingPageThree()
        ],
      ),
    );
  }
}
