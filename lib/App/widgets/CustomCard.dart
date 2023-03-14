import 'package:blood4life/core/utils/helperFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/values/colors.dart';

class CustomCard extends StatelessWidget {
  const   CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: textFormFieldColor,
        ),
        // height: getMediaQueryHeight(context: context, value: 94),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    // radius: 17,
                    backgroundColor: textFormFieldColor,
                    child: SvgPicture.asset(
                      "assets/images/icons/profilecircleBlack.svg",
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                  SizedBox(
                    width: getMediaQueryWidth(context: context, value: 8),
                  ),
                  const Text(
                    "يوسف المصري",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(
                height: getMediaQueryHeight(context: context, value: 10),
              ),
              Text(
                "أنا احتاج الى ٣اكياس من الدم لعملية جراحية طارئة لفصيلة دمo- في متستشفى الاقصى",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.sp,color: customCardTextColor),
              ),
              SizedBox(
                height: getMediaQueryHeight(context: context, value: 8),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/icons/homeGrey.svg",
                    height: 12.h,
                    width: 12.w,
                  ),
                  SizedBox(
                    width: getMediaQueryWidth(context: context, value: 4),
                  ),
                   Text(
                    "دير البلح",
                    style: TextStyle(fontSize: 8.sp,fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: getMediaQueryWidth(context: context, value: 24),
                  ),
                  SvgPicture.asset(
                    "assets/images/icons/drop.svg",
                    height: 12.h,
                    width: 12.w,
                  ),
                  SizedBox(
                    width: getMediaQueryWidth(context: context, value: 4),
                  ),
                   Text(
                      "-o",
                      style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: customCardTextColor)
                  ),
                  SizedBox(
                    width: getMediaQueryWidth(context: context, value: 24),
                  ),
                  SvgPicture.asset(
                    "assets/images/icons/callGrey.svg",
                    width: 12.w,
                    height: 12.h,
                  ),
                  SizedBox(width: getMediaQueryWidth(context: context, value: 4),),
                   SelectableText(
                      "0597589865",
                      style: TextStyle(fontSize: 8.sp,fontWeight: FontWeight.w500,color: customCardTextColor)
                  ),
                  Spacer(),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios_sharp,size: 24,))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
