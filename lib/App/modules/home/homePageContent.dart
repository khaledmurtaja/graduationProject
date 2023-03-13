import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/utils/helperFunctions.dart';
import '../../widgets/CustomCard.dart';
import '../../widgets/customButtonWidget.dart';
import 'controller.dart';

class HomeScreenContent extends GetView<HomeScreenController> {
  final List<String> imgList = [
    "assets/images/banners/banner1.jpg",
    "assets/images/banners/banner2.jpg",
    "assets/images/banners/banner3.jpg",
    "assets/images/banners/banner4.jpg",
    "assets/images/banners/banner5.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
            items: imgList
                .map((e) => Image.asset(
                      e,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ))
                .toList(),
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                controller.changeCurrentBannerIndex(index);
              },
              viewportFraction: 1,
              height: getMediaQueryHeight(context: context, value: 200),
            )),
        SizedBox(
          height: getMediaQueryHeight(context: context, value: 8),
        ),
        GetBuilder(
          builder: (HomeScreenController controller) {
            return Center(
                child: SmoothPageIndicator(
              controller:
                  PageController(initialPage: controller.currentBannerIndex),
              count: 5,
              effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.red, dotHeight: 10, dotWidth: 10),
            ));
          },
        ),
        SizedBox(
          height: getMediaQueryHeight(context: context, value: 24),
        ),
        Padding(
          padding: EdgeInsets.only(right: 24.w),
          child: CustomButton(
            onPressed: () {},
            text: 'أنشأ طلب تبرع',
          ),
        ),
        SizedBox(
          height: getMediaQueryHeight(context: context, value: 32),
        ),
        Padding(
          padding: EdgeInsets.only(right: 24.w),
          child: Text(
            "طلبات التبرع الحديثة",
            style: TextStyle(fontSize: 20.spMin, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          height: getMediaQueryHeight(context: context, value: 24),
        ),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) => CustomCard(),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: getMediaQueryHeight(context: context, value: 16),
              );
            },
          ),
        )
      ],
    );
  }
}
