import 'package:blood4life/App/data/models/donationOfferModel.dart';
import 'package:blood4life/App/modules/donationAppeal/widgets/bloodUnit.dart';
import 'package:blood4life/App/widgets/offerCard.dart';
import 'package:blood4life/core/utils/helperFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../core/values/colors.dart';
import '../../data/models/donationAppealModel.dart';
import '../../widgets/appealCard.dart';
import '../../widgets/customDropdownButton.dart';
import '../../widgets/fistPageErrorIndicator.dart';
import 'controller.dart';

class AppealScreen extends GetView<DonationAppealScreenController> {
  const AppealScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(
              top: getMediaQueryHeight(context: context, value: 24)),
          child: Text(
            "الطلبات",
            style: TextStyle(
                fontSize: 20.spMin,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.bottomSheet(GetBuilder<DonationAppealScreenController>(
                builder: (controller) {
                  return SizedBox(
                    height: getMediaQueryHeight(context: context, value: 543),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        reverse: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                color: bottomSheetLineColor,
                                width: 100,
                                height: 3,
                              ),
                            ),
                            SizedBox(
                              height: getMediaQueryHeight(
                                  context: context, value: 16.75),
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                Text(
                                  "الفرز والعرض حسب",
                                  style: TextStyle(
                                      fontSize: 20.spMin,
                                      fontWeight: FontWeight.w700),
                                ),
                                const Spacer(),
                                InkWell(
                                    onTap: () {
                                      Get.back();

                                      ///close the bottom sheet
                                    },
                                    child: SvgPicture.asset(
                                        "assets/images/icons/close.svg"))
                              ],
                            ),
                            Text(
                              "الفرز",
                              style: TextStyle(
                                  fontSize: 20.spMin,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: getMediaQueryHeight(
                                  context: context, value: 16),
                            ),
                            Text(
                              "فصيلة الدم",
                              style: TextStyle(
                                  fontSize: 20.spMin,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: getMediaQueryHeight(
                                  context: context, value: 8),
                            ),
                            Row(
                              children: [
                                BloodUnit(
                                  bloodUnit: '-A',
                                  controller: controller,
                                ),
                                BloodUnit(
                                  bloodUnit: '-B',
                                  controller: controller,
                                ),
                                BloodUnit(
                                  bloodUnit: '-AB',
                                  controller: controller,
                                ),
                                BloodUnit(
                                  bloodUnit: '-O',
                                  controller: controller,
                                )
                              ],
                            ),
                            SizedBox(
                              height: getMediaQueryHeight(
                                  context: context, value: 8),
                            ),
                            Row(
                              children: [
                                BloodUnit(
                                  bloodUnit: '+A',
                                  controller: controller,
                                ),
                                BloodUnit(
                                  bloodUnit: '+B',
                                  controller: controller,
                                ),
                                BloodUnit(
                                  bloodUnit: '+AB',
                                  controller: controller,
                                ),
                                BloodUnit(
                                  bloodUnit: '+O',
                                  controller: controller,
                                )
                              ],
                            ),
                            SizedBox(
                              height: getMediaQueryHeight(
                                  context: context, value: 16),
                            ),
                            Text(
                              "مكان السكن",
                              style: TextStyle(
                                  fontSize: 16.spMin,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: getMediaQueryHeight(
                                  context: context, value: 8),
                            ),
                            CustomDropdownButton(
                              iconPath: "assets/images/icons/home.svg",
                              height: getMediaQueryHeight(
                                  context: context, value: 48),
                              width: getMediaQueryWidth(
                                  context: context, value: 176),
                              textStyle: TextStyle(
                                  fontSize: 16.spMin,
                                  color: customCardTextColor),
                              data: controller.city,
                              onChange: (value) {
                                controller.changeSelectedAddress(
                                    valueSelectedAddress: value);
                              },
                            ),
                            SizedBox(
                                height: getMediaQueryHeight(
                                    context: context, value: 32)),
                            Text(
                              "العرض حسب",
                              style: TextStyle(
                                  fontSize: 20.spMin,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: getMediaQueryHeight(
                                  context: context, value: 16),
                            ),
                            InkWell(
                              onTap: () {
                                controller.isAppealTabSelected
                                    ? controller.filterAppealsData(
                                        bloodType: controller.selectedBloodUnit,
                                        location: controller.selectedAddress,
                                        oldestFirst: true,
                                      )
                                    : controller.filterOffersData(
                                        bloodType: controller.selectedBloodUnit,
                                        location: controller.selectedAddress,
                                        oldestFirst: true,
                                      );
                                Get.back();

                                Future.delayed(const Duration(seconds: 1), () {
                                  showSnackBar(
                                      title: "تمت بنجاح",
                                      message: "تم فلترة النتائج بنجاح ",
                                      backGroundColor: Colors.green.shade400,
                                      snackPosition: SnackPosition.TOP);
                                });
                              },
                              child: Text(
                                "من الاقدم الى الأحدث",
                                style: TextStyle(
                                    fontSize: 16.spMin,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              height: getMediaQueryHeight(
                                  context: context, value: 16),
                            ),
                            InkWell(
                              onTap: () {
                                controller.isAppealTabSelected
                                    ? controller.filterAppealsData(
                                        bloodType: controller.selectedBloodUnit,
                                        location: controller.selectedAddress,
                                        oldestFirst: false,
                                      )
                                    : controller.filterOffersData(
                                        bloodType: controller.selectedBloodUnit,
                                        location: controller.selectedAddress,
                                        oldestFirst: false,
                                      );
                                Get.back();
                                Future.delayed(const Duration(seconds: 1), () {
                                  showSnackBar(
                                      title: "تمت بنجاح",
                                      message: "تم فلترة النتائج بنجاح ",
                                      backGroundColor: Colors.green.shade400,
                                      snackPosition: SnackPosition.TOP);
                                });
                              },
                              child: Text(
                                "من الأحدث الى الاقدم",
                                style: TextStyle(
                                    fontSize: 16.spMin,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
                  backgroundColor: Colors.white,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50))));
            },
            child: Padding(
              padding: EdgeInsets.only(
                  top: getMediaQueryHeight(context: context, value: 16)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: textFormFieldColor,
                ),
                height: getMediaQueryHeight(context: context, value: 40),
                width: getMediaQueryWidth(context: context, value: 40),
                child: Padding(
                  padding: EdgeInsets.only(
                      right: getMediaQueryWidth(context: context, value: 5),
                      left: getMediaQueryWidth(context: context, value: 5),
                      top: getMediaQueryHeight(context: context, value: 6),
                      bottom: getMediaQueryWidth(context: context, value: 6)),
                  child: SvgPicture.asset(
                    "assets/images/icons/documentfilter.svg",
                    height: getMediaQueryHeight(context: context, value: 27),
                    width: getMediaQueryWidth(context: context, value: 29),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: GetBuilder<DonationAppealScreenController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.only(
                top: getMediaQueryHeight(context: context, value: 24)),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: const Radius.circular(10),
                        topLeft: const Radius.circular(10),
                        bottomRight: controller.isAppealTabSelected
                            ? const Radius.circular(0)
                            : const Radius.circular(10),
                        bottomLeft: !controller.isAppealTabSelected
                            ? const Radius.circular(0)
                            : const Radius.circular(10)),
                    color: textFormFieldColor,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            controller.changeSelectedTab(
                                isAppealSelected: true);
                          },
                          child: Container(
                            height: getMediaQueryHeight(
                                context: context, value: 24),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: controller.isAppealTabSelected
                                      ? const BorderSide(
                                          color: Colors.red, width: 2)
                                      : BorderSide.none),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "المناشدات",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: controller.isAppealTabSelected
                                        ? Colors.black
                                        : customCardTextColor,
                                    fontSize: 12.spMin),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            controller.changeSelectedTab(
                                isAppealSelected: false);
                          },
                          child: Container(
                            height: getMediaQueryHeight(
                                context: context, value: 24),
                            decoration: BoxDecoration(
                              border: Border(
                                  right: const BorderSide(
                                      width: 1.3, color: Color(0xffBEBEBE)),
                                  bottom: !controller.isAppealTabSelected
                                      ? const BorderSide(
                                          color: Colors.red, width: 2)
                                      : BorderSide.none),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "طلبات التبرع",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: !controller.isAppealTabSelected
                                        ? Colors.black
                                        : customCardTextColor,
                                    fontSize: 12.spMin),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getMediaQueryHeight(context: context, value: 24),
                ),
                Expanded(
                  child: controller.isAppealTabSelected
                      ? RefreshIndicator(
                          onRefresh: () {
                            return Future.sync(() => controller
                                .pagingControllerForAppeals
                                .refresh());
                          },
                          child:
                              PagedListView<int, DonationAppealModel>.separated(
                            builderDelegate:
                                PagedChildBuilderDelegate<DonationAppealModel>(
                                    firstPageErrorIndicatorBuilder: (context) {
                                      return firstPageErrorIndicator(controller,
                                          () {
                                        controller.pagingControllerForAppeals
                                            .retryLastFailedRequest();
                                      });
                                    },
                                    newPageErrorIndicatorBuilder: (context) {
                                      return InkWell(
                                        onTap: () {
                                          controller.pagingControllerForAppeals
                                              .retryLastFailedRequest();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: const [
                                              Text(
                                                  "حدث خطأ ما.اضعط للمحاولة مجددا"),
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
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: getMediaQueryHeight(
                                    context: context, value: 16),
                              );
                            },
                            pagingController:
                                controller.pagingControllerForAppeals,
                          ),
                        )
                      : RefreshIndicator(
                          onRefresh: () {
                            return Future.sync(() =>
                                controller.pagingControllerForOffers.refresh());
                          },
                          child:
                              PagedListView<int, DonationOfferModel>.separated(
                            builderDelegate:
                                PagedChildBuilderDelegate<DonationOfferModel>(
                                    firstPageErrorIndicatorBuilder: (context) {
                                      return firstPageErrorIndicator(controller,
                                          () {
                                        controller.pagingControllerForOffers
                                            .retryLastFailedRequest();
                                      });
                                    },
                                    newPageErrorIndicatorBuilder: (context) {
                                      return InkWell(
                                        onTap: () {
                                          controller.pagingControllerForOffers
                                              .retryLastFailedRequest();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: const [
                                              Text(
                                                  "حدث خطأ ما.اضعط للمحاولة مجددا"),
                                              Icon(Icons.refresh)
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    animateTransitions: true,
                                    itemBuilder: (context, item, index) {
                                      return CustomOfferCard(
                                        donationOfferModel: item,
                                      );
                                    }),
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: getMediaQueryHeight(
                                    context: context, value: 16),
                              );
                            },
                            pagingController:
                                controller.pagingControllerForOffers,
                          ),
                        ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
