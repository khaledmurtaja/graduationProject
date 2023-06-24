import 'package:blood4life/firebase_options.dart';
import 'package:blood4life/routes/pages.dart';
import 'package:blood4life/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'App/data/services/apiService.dart';
import 'App/data/services/firebaseMessagingService.dart';
import 'App/data/services/sharedPrefService.dart';
import 'core/utils/helperFunctions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.getToken();
  await initServices();
  FirebaseMessaging.onBackgroundMessage(messageBackgroundHandler);

  ///here we will initialize all of the services we need,like storage,API,Database.
  runApp(const MyApp());
}

Future<void> initServices() async {
  await Get.putAsync(() => AppSharedPref().init());

  await Get.putAsync(() => ApiService().init());
  Get.put<FirebaseMessagingService>(FirebaseMessagingService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return GetMaterialApp(
          initialRoute: Routes.HOME,
          textDirection: TextDirection.rtl,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.red, fontFamily: "Tajawal"),
          getPages: AppPages.pages,
        );
      },
    );
  }
}

// ipconfig