import 'package:blood4life/App/modules/notification/widgets/customCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/utils/helperFunctions.dart';
import 'controller.dart';
class NotificationScreen extends GetView<NotificationScreenController> {
  NotificationScreen({super.key});
  bool notf = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'الإشعارات',
          style: TextStyle(
              fontSize: 24.spMin,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
      ),
      body: notf
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/icons/no_notifications.svg",
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: getMediaQueryHeight(context: context, value: 40),
                  ),
                  Text(
                    'عذا لا يوجد أي إشعارات',
                    style: TextStyle(
                        fontSize: 16.spMin, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'اليوم',
                    style: TextStyle(
                        fontSize: 16.spMin,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: getMediaQueryHeight(context: context, value: 16),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) => CustomCard(
                      imageUrl:
                          "assets/images/test/young-bearded-man-with-striped-shirt.jpg",
                      supTitle:
                          'سيتم عقد ورشة تعليمية بعنوان فوائد التبرع بالدم بشكل دوري في الجامعة الاسلامية بتاريخ 22/10/2023م الساعة 11 صباحا',
                      time: '9:30 Am',
                      title: 'بنك الدم المركزي',
                    ),
                    separatorBuilder: (BuildContext context, int  index) {
                      return SizedBox(
                        height:
                            getMediaQueryHeight(context: context, value: 16),
                      );
                    },
                  ),
                  SizedBox(
                    height: getMediaQueryHeight(context: context, value: 24),
                  ),
                  Text(
                    'قبل يومين',
                    style: TextStyle(
                        fontSize: 16.spMin,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: getMediaQueryHeight(context: context, value: 16),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) => CustomCard(
                      imageUrl:
                          "assets/images/test/young-bearded-man-with-striped-shirt.jpg",
                      supTitle:
                          'سيتم عقد ورشة تعليمية بعنوان فوائد التبرع بالدم بشكل دوري في الجامعة الاسلامية بتاريخ 22/10/2023م الساعة 11 صباحا',
                      time: '9:30 Am',
                      title: 'بنك الدم المركزي',
                    ),
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height:
                            getMediaQueryHeight(context: context, value: 16),
                      );
                    },
                  ),
                  SizedBox(
                    height: getMediaQueryHeight(context: context, value: 24),
                  ),
                  Text(
                    'قبل 3 أيام',
                    style: TextStyle(
                        fontSize: 16.spMin,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: getMediaQueryHeight(context: context, value: 16),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) => CustomCard(
                      imageUrl:
                          "assets/images/test/young-bearded-man-with-striped-shirt.jpg",
                      supTitle:
                          'سيتم عقد ورشة تعليمية بعنوان فوائد التبرع بالدم بشكل دوري في الجامعة الاسلامية بتاريخ 22/10/2023م الساعة 11 صباحا',
                      time: '9:30 Am',
                      title: 'بنك الدم المركزي',
                    ),
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height:
                            getMediaQueryHeight(context: context, value: 16),
                      );
                    },
                  ),
                  SizedBox(
                    height: getMediaQueryHeight(context: context, value: 10),
                  )
                ],
              ),
            ),
    );
  }
}
