import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../blog/page.dart';
import '../donationAppeal/page.dart';
import '../notification/page.dart';
import '../profile/page.dart';
import 'homePageContent.dart';

class HomeScreenController extends GetxController {
  int currentPageIndex = 0;
  int currentBannerIndex = 0;
  List<Widget> pages = [
    HomeScreenContent(),
    AppealScreen(),
    NotificationScreen(),
    BlogScreen(),
    ProfileScreen()
  ];

  @override
  void onInit() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }


  changeCurrentBannerIndex(int index) {
    currentBannerIndex = index;
    update();
  }

  changeCurrentPageIndex(int index) {
    currentPageIndex = index;
    update();
  }
}
