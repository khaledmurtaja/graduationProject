import 'package:blood4life/App/modules/landingScreen/widgets/page1Widget.dart';
import 'package:blood4life/App/modules/landingScreen/widgets/page2Widget.dart';
import 'package:blood4life/App/modules/landingScreen/widgets/page3Widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class LandingScreen extends GetView<LandingPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Align(
          alignment: AlignmentDirectional.topEnd,
          child: Text(
            "تخطي",
            style: TextStyle(color: Colors.black, fontSize: 16,),
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
