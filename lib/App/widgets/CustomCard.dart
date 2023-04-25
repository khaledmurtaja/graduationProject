import 'package:blood4life/core/utils/helperFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/values/colors.dart';

class CustomCard extends StatelessWidget {
  const   CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: textFormFieldColor,
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: getMediaQueryWidth(context: context, value: 8),vertical: getMediaQueryWidth(context: context, value: 16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/images/icons/profilecircleBlack.svg",
                  width: 24.w,
                  height: 24.h,
                ),
                SizedBox(
                  width: getMediaQueryWidth(context: context, value: 8),
                ),
                SelectableText(
                  "يوسف المصري",
                  style: TextStyle(fontSize: 16.spMin, fontWeight: FontWeight.w500),
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
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10.spMin,color: customCardTextColor),
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
                SelectableText(
                  "دير البلح",
                  style: TextStyle(fontSize: 8.spMin,fontWeight: FontWeight.w400),
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
                SelectableText(
                    "-o",
                    style: TextStyle(fontSize: 10.spMin,fontWeight: FontWeight.w500,color: customCardTextColor)
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
                  style: TextStyle(fontSize: 8.spMin,fontWeight: FontWeight.w500,color: customCardTextColor),
                ),
                const Spacer(),
                IconButton(onPressed: (){}, icon:  Icon(Icons.arrow_forward_ios_sharp,size: 24.spMin,))
              ],
            )
          ],
        ),
      ),
    );
  }
}
