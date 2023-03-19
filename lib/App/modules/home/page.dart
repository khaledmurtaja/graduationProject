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
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SizedBox(
        height: getMediaQueryHeight(context: context, value: 83),
        child: GetBuilder(
          builder: (HomeScreenController controller) {
            return BottomNavigationBar(
                onTap: (index) {
                  controller.changeCurrentPageIndex(index);
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
                        padding: EdgeInsets.only(bottom: 5.spMin),
                        child: SvgPicture.asset(controller.currentPageIndex == 0
                            ? boldHomeIcon
                            : linearHomeIcon),
                      ),
                      label: "الرئيسية"),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(bottom: 5.spMin),
                        child: SvgPicture.asset(controller.currentPageIndex == 1
                            ? boldDirectBoxReciveIcon
                            : linearDirectBoxReciveIcon),
                      ),
                      label: "طلبات التبرع"),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(bottom: 5.spMin),
                        child: SvgPicture.asset(controller.currentPageIndex == 2
                            ? boldNotificationIcon
                            : linearNotificationIcon),
                      ),
                      label: "الاشعارات"),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 5.spMin),
                      child: SvgPicture.asset(controller.currentPageIndex == 3
                          ? boldBookIcon
                          : linearBookIcon),
                    ),
                    label: "مدونتي",
                  ),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(bottom: 5.spMin),
                        child: SvgPicture.asset(controller.currentPageIndex == 4
                            ? boldProfileIcon
                            : linearProfileIcon),
                      ),
                      label: "صفحتي")
                ]);
          },
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: getMediaQueryWidth(context: context, value: 24)),
        child: GetBuilder(builder: (HomeScreenController controller) {
          return SafeArea(child: controller.pages[controller.currentPageIndex]);
        }),
      ),
    );
  }
}
