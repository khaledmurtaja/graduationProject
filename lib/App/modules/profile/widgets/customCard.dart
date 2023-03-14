import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/helperFunctions.dart';
import '../../../../core/values/colors.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
              width: getMediaQueryWidth(context: context, value: 327),

      child: Card(
        // width: getMediaQueryWidth(context: context, value: 327),
        // height: getMediaQueryHeight(context: context, value: 78),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(8),
        //   color: textFormFieldColor,
        // ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: textFormFieldColor,
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.only(
            top: getMediaQueryHeight(context: context, value: 8),
            left: getMediaQueryWidth(context: context, value: 16),
            bottom: getMediaQueryHeight(context: context, value: 8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: getMediaQueryWidth(context: context, value: 8),),
                  Container(
                    width: 40,
                    height:40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          "assets/images/test/young-bearded-man-with-striped-shirt.jpg",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getMediaQueryWidth(context: context, value: 8),
                  ),
                  Text(
                    'يوسف هاني المصري',
                    style: TextStyle(
                        fontSize: 16.spMin,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: getMediaQueryHeight(context: context, value: 8),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: getMediaQueryWidth(context: context, value: 8),
                ),
                child: Text(
                  "yousefalmassri3ux@gmail.com",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 8.sp,
                    color: cardTextColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
