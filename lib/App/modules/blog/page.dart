import 'package:blood4life/App/modules/blog/widgets/customCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/helperFunctions.dart';
import '../../../core/values/colors.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'مدونتي',
          style: TextStyle(
              fontSize: 24.spMin,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: getMediaQueryWidth(context: context, value: 24),
          right: getMediaQueryWidth(context: context, value: 24),
        ),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: 6,
          itemBuilder: (context, index) => CustomCard(
            imageUrl: 'assets/images/test/blog.jpg',
            title: 'ما هو التبرع بالدم ؟',
            supTitle:
                'يعتبر الدم مادة حيوية لا يمكن تصنيعها، ولابد أن تأتي من  الإنسان السليم صحيا للإنسان المريض المحتاج إليها من أجل العلاج، ويعتبر التبرع بالدم الوسيلة الوحيدة ل يعتبر الدم مادة حيوية لا ',
          ),
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: getMediaQueryHeight(context: context, value: 16),
            );
          },
        ),
      ),
    );
  }
}
