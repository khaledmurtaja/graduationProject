import 'package:blood4life/core/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/services/sharedPrefService.dart';

class HomeMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    AppSharedPref appSharedPref = Get.find<AppSharedPref>();
    bool? isLandingPageSkipped =
        appSharedPref.getBoolValue(key: landingPageKey);
    if(isLandingPageSkipped!=null){
      return null;
    }else{
      return const RouteSettings(name: "/LandingPage");

    }
  }
}
