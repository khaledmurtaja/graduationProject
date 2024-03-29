// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/utils/helperFunctions.dart';
import '../../../core/values/strings.dart';
import '../../../routes/routes.dart';
import '../../data/models/donationAppealModel.dart';
import '../../data/services/sharedPrefService.dart';
import '../../widgets/appealCard.dart';
import '../../widgets/customButtonWidget.dart';
import '../../widgets/customLoadingWidget.dart';
import '../../widgets/fistPageErrorIndicator.dart';
import '../../widgets/singleErrorTextWidget.dart';
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
    return Stack(children: [
      RefreshIndicator(
        onRefresh: () async {
          await controller.fetchCampaigns();
          return Future.sync(() => controller.pagingController.refresh());
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder(builder: (HomeScreenController controller) {
              return controller.campaignsIsLoading
                  ? const CustomLoadingWidget()
                  : controller.campaigns!.isEmpty
                      ? SingleErrorTextWidget(
                          errorMessage: 'لا يوجد حملات في الوقت الحالي !',
                          height: 200,
                        )
                      : CarouselSlider(
                          items: controller.campaigns!
                              .map((e) => Image.network(
                                    e.imageUrl!,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ))
                              .toList(),
                          options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              controller.changeCurrentBannerIndex(index);
                            },
                            viewportFraction: 1,
                            height:
                                getMediaQueryHeight(context: context, value: 200),
                          ),
                        );
            }),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 8),
            ),
            GetBuilder(
              builder: (HomeScreenController controller) {
                return controller.campaignsIsLoading
                    ? const SizedBox()
                    : controller.errorMessage!.isNotEmpty
                        ? const SizedBox()
                        : controller.campaigns!.isEmpty
                            ? const SizedBox()
                            : Center(
                                child: SmoothPageIndicator(
                                controller: PageController(
                                    initialPage: controller.currentBannerIndex),
                                count: controller.campaigns!.length,
                                effect: const ExpandingDotsEffect(
                                    activeDotColor: Colors.red,
                                    dotHeight: 10,
                                    dotWidth: 10),
                              ));
              },
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 24),
            ),
            CustomButton(
              onPressed: () {
                bool? isUserVerified = Get.find<AppSharedPref>()
                    .getBoolValue(key: isEmailVerifiedKey);
                if (controller.isLoggedIn != null &&
                    controller.isLoggedIn == true &&
                    isUserVerified != null &&
                    isUserVerified == true) {
                  Get.toNamed(Routes.DONATION_FORM);
                } else if (controller.isLoggedIn != null &&
                    controller.isLoggedIn == true &&
                    isUserVerified != null &&
                    isUserVerified == false) {
                  customDialog(
                      context: context,
                      title: "العملية تحتاج الى توثيق البريد الالكتروني",
                      controller: controller,
                      btnOkText: "توثيق البريد الالكتروني",
                      onDismissCallback: () {
                        controller.blurScreenFun(false);
                      },
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {
                        Get.back();
                        Get.toNamed("/sendVerificationCode");
                      }).show();
                } else {
                  controller.blurScreenFun(true);
                  customDialog(
                      context: context,
                      controller: controller,
                      onDismissCallback: () {
                        controller.blurScreenFun(false);
                      },
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {
                        Get.toNamed(Routes.LOGIN);
                      }).show();
                }
              },
              text: 'أنشئ طلب تبرع',
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 32),
            ),
            Text(
              "مناشدات للتبرع بالدم",
              style: TextStyle(fontSize: 20.spMin, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 24),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () {
                  return Future.sync(() => controller.pagingController.refresh());
                },
                child: PagedListView<int, DonationAppealModel>.separated(
                  pagingController: controller.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<DonationAppealModel>(
                      firstPageErrorIndicatorBuilder: (context) {
                        return firstPageErrorIndicator(controller, () {
                          controller.pagingController.retryLastFailedRequest();
                        });
                      },
                      newPageErrorIndicatorBuilder: (context) {
                        return InkWell(
                          onTap: () {
                            controller.pagingController.retryLastFailedRequest();
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("حدث خطأ ما.اضعط للمحاولة مجددا"),
                                Icon(Icons.refresh)
                              ],
                            ),
                          ),
                        );
                      },
                      animateTransitions: true,
                      itemBuilder: (context, item, index) {
                        return CustomAppealCard(
                          donationAppealModel: item,
                        );
                      }),
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: getMediaQueryHeight(context: context, value: 16),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      GetBuilder<HomeScreenController>(builder: (controller) {
        if (controller.blurScreen) {
          return BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: Container(
                color: Colors.transparent,
              ));
        } else {
          return Container();
        }
      })
    ]);
  }
}
