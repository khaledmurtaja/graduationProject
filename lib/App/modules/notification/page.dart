import 'package:blood4life/App/modules/notification/widgets/customCard.dart';
import 'package:blood4life/App/modules/notification/widgets/noNotificationsState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/utils/helperFunctions.dart';
import 'controller.dart';

class NotificationScreen extends GetView<NotificationScreenController> {
  NotificationScreen({super.key});
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
      body: Obx(
        () {
          return controller.isloading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : controller.newNotifications.isEmpty &&
                      controller.oldNotifications.isEmpty
                  ? const NoNotificationsState()
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'جديدة',
                            style: TextStyle(
                                fontSize: 16.spMin,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: getMediaQueryHeight(
                                context: context, value: 16),
                          ),
                          controller.newNotifications.isEmpty
                              ? Container(
                                  height: getMediaQueryHeight(
                                      context: context, value: 100),
                                  child: Center(
                                    child: Text(
                                      'لا يوجد اشعارات جديدة',
                                      style: TextStyle(
                                        fontSize: 16.spMin,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                )
                              : ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.newNotifications.length,
                                  itemBuilder: (context, index) => CustomCard(
                                    imageUrl: controller
                                        .newNotifications[index].imageUrl,
                                    supTitle:
                                        controller.newNotifications[index].body,
                                    time: controller.newNotifications[index]
                                        .formattedNoticeTime!,
                                    title: controller
                                        .newNotifications[index].title,
                                  ),
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      height: getMediaQueryHeight(
                                          context: context, value: 16),
                                    );
                                  },
                                ),
                          SizedBox(
                            height: getMediaQueryHeight(
                                context: context, value: 24),
                          ),
                          Text(
                            'الأقدم',
                            style: TextStyle(
                                fontSize: 16.spMin,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: getMediaQueryHeight(
                                context: context, value: 16),
                          ),
                          controller.oldNotifications.isEmpty
                              ? Container(
                                  height: getMediaQueryHeight(
                                      context: context, value: 100),
                                  child: Center(
                                    child: Text(
                                      'لا يوجد اشعارات قديمة',
                                      style: TextStyle(
                                          fontSize: 16.spMin,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey),
                                    ),
                                  ),
                                )
                              : ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.oldNotifications.length,
                                  itemBuilder: (context, index) => CustomCard(
                                    imageUrl: controller
                                        .oldNotifications[index].imageUrl,
                                    supTitle:
                                        controller.oldNotifications[index].body,
                                    time: controller.oldNotifications[index]
                                        .formattedNoticeTime!,
                                    title: controller
                                        .oldNotifications[index].title,
                                  ),
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      height: getMediaQueryHeight(
                                          context: context, value: 16),
                                    );
                                  },
                                ),
                          SizedBox(
                            height: getMediaQueryHeight(
                                context: context, value: 24),
                          ),
                          SizedBox(
                            height: getMediaQueryHeight(
                                context: context, value: 10),
                          )
                        ],
                      ),
                    );
        },
      ),
    );
  }
}
