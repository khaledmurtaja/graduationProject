import 'package:blood4life/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'App/modules/blog/page.dart';
import 'App/modules/donationForm/binding.dart';
import 'App/modules/donationForm/page.dart';
import 'App/modules/home/binding.dart';
import 'App/modules/home/page.dart';
import 'App/modules/profile/binding.dart';
import 'App/modules/profile/page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return GetMaterialApp(
          textDirection: TextDirection.rtl,
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.red, fontFamily: "Tajawal"),
          getPages: AppPages.pages,
          initialBinding: ProfileBinding(),
          home: BlogScreen(),
        );
      },
    );
  }
}
