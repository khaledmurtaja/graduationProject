import 'dart:convert';

import 'package:get/get.dart';

import '../../data/models/notificationModel.dart';
import '../../data/services/sharedPrefService.dart';

class NotificationScreenController extends GetxController {
  final AppSharedPref appSharedPref = Get.find<AppSharedPref>();
  RxList<NotificationModel> newNotifications = <NotificationModel>[].obs;
  RxList<NotificationModel> oldNotifications = <NotificationModel>[].obs;
  final isloading = false.obs;

  @override
  void onInit() async {
    await loadStoredNotifications();
    // appSharedPref.removeValue(key: 'notifications');

    super.onInit();
  }

  Future<void> loadStoredNotifications() async {
    isloading.value = true;

    List<NotificationModel> storedNotifications =
        await getStoredNotifications();
    final currentTime = DateTime.now();
    final Duration timeThreshold = Duration(hours: 24);

    newNotifications.clear();
    oldNotifications.clear();

    for (final notification in storedNotifications) {
      final notificationTime = DateTime.parse(notification.arrivalTime);
      final formattedNoticeTime = notification.formatNoticeTime();
      notification.formattedNoticeTime = formattedNoticeTime;
      if (currentTime.difference(notificationTime) <= timeThreshold) {
        newNotifications.add(notification);
      } else {
        oldNotifications.add(notification);
      }
    }
    newNotifications.value = newNotifications.reversed.toList();
    oldNotifications.value = oldNotifications.reversed.toList();

    isloading.value = false;
  }

  Future<List<NotificationModel>> getStoredNotifications() async {
    List<String>? storedNotifications =
        appSharedPref.getStringList(key: 'notifications');

    if (storedNotifications != null) {
      return storedNotifications.map((jsonString) {
        Map<String, dynamic> json = jsonDecode(jsonString);
        return NotificationModel.fromJson(json);
      }).toList();
    }

    return [];
  }
}
