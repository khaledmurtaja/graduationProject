import 'dart:convert';

import 'package:blood4life/App/data/models/notificationModel.dart';
import 'package:blood4life/App/data/services/sharedPrefService.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class FirebaseMessagingService extends GetxService {
  FirebaseMessaging? messaging;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    messaging = FirebaseMessaging.instance;

    configureLocalNotifications();

    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      print('Message clicked!');
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      // print("message recieved");
      final repo = Get.find<AppSharedPref>();

      if (message.notification != null && message.notification!.body != null) {
        await showNotification(
          message.notification!.title ?? 'Notification',
          message.notification!.body!,
        );

        final notificationData = NotificationModel(
          arrivalTime: DateTime.now().toString(),
          imageUrl: message.notification!.android!.imageUrl ?? '',
          title: message.notification!.title ?? '',
          body: message.notification!.body ?? '',
        );

        // Save notification data to shared preferences
        List<String> storedNotifications =
            repo.getStringList(key: 'notifications') ?? [];

        storedNotifications.add(json.encode(notificationData.toJson()));

        await repo.setStringList(
            key: 'notifications', value: storedNotifications);
      }
    });
  }

  void configureLocalNotifications() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(String title, String body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'channel_description',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
    );
  }
}
