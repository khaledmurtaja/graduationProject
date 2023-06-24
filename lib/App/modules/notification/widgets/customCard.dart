// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/helperFunctions.dart';
import '../../../../core/values/colors.dart';

class CustomCard extends StatelessWidget {
  String imageUrl;
  String title;
  String supTitle;
  String time;

  CustomCard(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.supTitle,
      required this.time});

  @override
  Widget build(BuildContext context) {
    // print('imageUrl');

    // print(imageUrl);
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      imageUrl,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: getMediaQueryWidth(context: context, value: 8),
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 12.spMin,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              Spacer(),
              Text(
                time,
                style: TextStyle(
                    fontSize: 12.spMin,
                    fontWeight: FontWeight.w400,
                    color: timeColor),
              ),
            ],
          ),
          SizedBox(
            height: getMediaQueryHeight(context: context, value: 8),
          ),
          Text(
            supTitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
