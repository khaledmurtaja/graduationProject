import 'package:blood4life/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'App/modules/donationRequest/binding.dart';
import 'App/modules/donationRequest/page.dart';
import 'App/modules/login/binding.dart';
import 'App/modules/login/page.dart';
import 'App/modules/register/binding.dart';
import 'App/modules/register/page.dart';

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
          initialBinding: DonationRequestBinding(),
          home: DonationRequestScreen(),
        );
      },
    );
  }
}
