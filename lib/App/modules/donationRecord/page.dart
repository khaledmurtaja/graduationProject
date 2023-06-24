import 'package:blood4life/App/data/models/donationOfferModel.dart';
import 'package:blood4life/App/modules/donationRecord/widgets/NoAppealsFound.dart';
import 'package:blood4life/App/modules/donationRecord/widgets/NoOffersFound.dart';
import 'package:blood4life/App/modules/donationRecord/widgets/customAppealCard.dart';
import 'package:blood4life/App/modules/donationRecord/widgets/customOfferCard.dart';
import 'package:blood4life/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../core/utils/helperFunctions.dart';
import '../../../core/values/colors.dart';
import '../../data/models/donationAppealModel.dart';
import '../../widgets/customAppBar.dart';
import '../../widgets/fistPageErrorIndicator.dart';
import 'controller.dart';

class DonationRecordScreen extends GetView<DonationRecordScreenController> {
  const DonationRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        function: () {},
        title: 'سجل التبرع ',
      ),
      body: Column(
        children: [
          GetBuilder<DonationRecordScreenController>(
            builder: (controller) {
              return Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                child: Container(
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
                                "عروض التبرع",
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
              );
            },
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: getMediaQueryWidth(context: context, value: 24),
                right: getMediaQueryWidth(context: context, value: 24),
                top: getMediaQueryWidth(context: context, value: 16),
              ),
              child: GetBuilder<DonationRecordScreenController>(
                builder: (controller) {
                  if (controller.isAppealTabSelected) {
                    return PagedListView<int, DonationAppealModel>.separated(
                      builderDelegate:
                          PagedChildBuilderDelegate<DonationAppealModel>(
                              firstPageErrorIndicatorBuilder: (context) {
                                return firstPageErrorIndicator(controller, () {
                                  controller.pagingControllerForAppeals
                                      .retryLastFailedRequest();
                                });
                              },
                              noItemsFoundIndicatorBuilder: (context) =>
                                  const Center(child: NoAppealsFound()),
                              newPageErrorIndicatorBuilder: (context) {
                                return InkWell(
                                  onTap: () {
                                    controller.pagingControllerForAppeals
                                        .retryLastFailedRequest();
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
                                  iconPath: "assets/images/icons/edit.svg",
                                  onEdit: () {
                                    controller.donationAppealModel=item;
                                    Get.toNamed(Routes.UPDATE_DONATION_FORM);
                                  },
                                  onDelete: () {
                                    controller.deleteAppeal(
                                        appealId: item.operationId);
                                    controller.pagingControllerForAppeals
                                        .refresh();
                                  },
                                );
                              }),
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height:
                              getMediaQueryHeight(context: context, value: 16),
                        );
                      },
                      pagingController: controller.pagingControllerForAppeals,
                    );
                  } else {
                    return PagedListView<int, DonationOfferModel>.separated(
                      builderDelegate:
                          PagedChildBuilderDelegate<DonationOfferModel>(
                              firstPageErrorIndicatorBuilder: (context) {
                                return firstPageErrorIndicator(controller, () {
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
                              noItemsFoundIndicatorBuilder: (context) =>
                                  const NoOffersFound(),
                              animateTransitions: true,
                              itemBuilder: (context, item, index) {
                                return CustomOfferCard(
                                  donationOfferModel: item,
                                  iconPath: "assets/images/icons/edit.svg",
                                  onEdit: (){
                                    controller.donationOfferModel=item;
                                    Get.toNamed(Routes.UPDATE_DONATION_FORM);
                                  },
                                  onDelete: () {
                                    controller.deleteOffer(
                                        offerId: item.operationId);
                                    controller.pagingControllerForOffers
                                        .refresh();
                                  },
                                );
                              }),
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height:
                              getMediaQueryHeight(context: context, value: 16),
                        );
                      },
                      pagingController: controller.pagingControllerForOffers,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
