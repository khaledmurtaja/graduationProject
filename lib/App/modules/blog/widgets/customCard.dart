// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/helperFunctions.dart';
import '../../../../core/values/colors.dart';

class CustomCard extends StatelessWidget {
  String imageUrl;
  String title;
  String supTitle;
  CustomCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.supTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: textFormFieldColor,
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.only(
          top: getMediaQueryHeight(context: context, value: 16),
          right: getMediaQueryWidth(context: context, value: 16),
          left: getMediaQueryWidth(context: context, value: 16),
          bottom: getMediaQueryWidth(context: context, value: 16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: getMediaQueryWidth(context: context, value: 295),
              height: getMediaQueryHeight(context: context, value: 98),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(imageUrl),
                ),
              ),
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 8),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.spMin,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 4),
            ),
            Text(
              supTitle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
