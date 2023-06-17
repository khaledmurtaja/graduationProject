import 'package:blood4life/App/modules/EmailVerfication/page.dart';
import 'package:blood4life/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'App/data/services/apiService.dart';
import 'App/data/services/sharedPrefService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  ///here we will initialize all of the services we need,like storage,API,Database.
  runApp(const MyApp());
}

Future<void> initServices() async {
  await Get.putAsync(() => AppSharedPref().init());
  await Get.putAsync(() => ApiService().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return GetMaterialApp(
          initialRoute: "/home",
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