import 'package:blood4life/core/utils/helperFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/customAppBar.dart';

class WhoAreWeScreen extends StatelessWidget {
  const WhoAreWeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        function: () {
          Get.back();
        },
        title: 'من نحن ...',
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: getMediaQueryHeight(context: context, value: 16),
          left: getMediaQueryWidth(context: context, value: 24),
          right: getMediaQueryWidth(context: context, value: 24),
        ),
        child: Text(
          '''
      التطبيق الأول للتبرع في الدم في قطاع غزة
       الذي يساعد المستخدمين على إيجاد أشخاص 
      يحملون فصيلة دمهم و في منطقة سكنهك
       و مساعدتهم و التبرع بالدم لهم 
      وإنقاذ حياة العديد من الأشخاص و يوضح التطبيق ايضا للمستخدمين 
      أهمية عملية التبرع بالدم و فوائدها على الجسم 
      ويسعى التطبيق للأنتشار ومساعدة أكبر عدد ممكن من المحتاجين للدم و انقاذ حياتهم
        ''',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.spMin, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
