import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../core/utils/helperFunctions.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/consts.dart';
import 'controller.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double iconHeight = getMediaQueryHeight(context: context, value: 24);
    double iconWidth = getMediaQueryWidth(context: context, value: 24);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SizedBox(
        height: getMediaQueryHeight(context: context, value: 83),
        child: GetBuilder(
          builder: (HomeScreenController controller) {
            return BottomNavigationBar(
                onTap: (index) {
                  if (index == profilePageIndex) {
                    if (controller.isLoggedIn != null &&
                        controller.isLoggedIn == true) {
                      controller.changeCurrentPageIndex(index);
                    } else {
                      controller.blurScreenFun(true);
                      customDialog(
                              context: context,
                              controller: controller,
                              onDismissCallback: () {
                                controller.blurScreenFun(false);
                              },
                          title: "الولوج الى هذه الصفحة يحتاج منك تسجيل الدخول",
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {
                                Get.toNamed("/login");
                              })
                          .show();
                    }
                  } else {
                    controller.changeCurrentPageIndex(index);
                  }
                },
                currentIndex: controller.currentPageIndex,
                backgroundColor: btmNavColor,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white,
                selectedFontSize: 12.spMin,
                unselectedFontSize: 12.spMin,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: SvgPicture.asset(
                          controller.currentPageIndex == 0
                              ? boldHomeIcon
                              : linearHomeIcon,
                          height: iconHeight,
                          width: iconWidth,
                        ),
                      ),
                      label: "الرئيسية"),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: SvgPicture.asset(
                            controller.currentPageIndex == 1
                                ? boldDirectBoxReciveIcon
                                : linearDirectBoxReciveIcon,
                            height: iconHeight,
                            width: iconWidth),
                      ),
                      label: "طلبات التبرع"),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: SvgPicture.asset(
                            controller.currentPageIndex == 2
                                ? boldNotificationIcon
                                : linearNotificationIcon,
                            height: iconHeight,
                            width: iconWidth),
                      ),
                      label: "الاشعارات"),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: SvgPicture.asset(
                          controller.currentPageIndex == 3
                              ? boldBookIcon
                              : linearBookIcon,
                          height: iconHeight,
                          width: iconWidth),
                    ),
                    label: "مدونتي",
                  ),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: SvgPicture.asset(
                            controller.currentPageIndex == 4
                                ? boldProfileIcon
                                : linearProfileIcon,
                            height: iconHeight,
                            width: iconWidth),
                      ),
                      label: "صفحتي")
                ]);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getMediaQueryWidth(context: context, value: 24)),
        child: GetBuilder(builder: (HomeScreenController controller) {
          return SafeArea(child: controller.pages[controller.currentPageIndex]);
        }),
      ),
    );
  }
}
