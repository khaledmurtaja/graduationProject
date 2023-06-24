// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/helperFunctions.dart';

class CustomRow extends StatelessWidget {
  String firstText;
  String secondText;
  FontWeight firstTextFontWeight;
  double secondTextFontSize;
  String? iconPath;
  Function? onClickEditIcon;
  CustomRow(
      {Key? key,
      required this.firstText,
      required this.secondText,
      required this.firstTextFontWeight,
      required this.secondTextFontSize,
         this.onClickEditIcon,
      this.iconPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firstText,
          style: TextStyle(
            fontSize: 16.spMin,
            fontWeight: firstTextFontWeight,
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: getMediaQueryWidth(context: context, value: 8),
        ),
        Expanded(
          child: Text(
            secondText,
            style: TextStyle(
              fontSize: secondTextFontSize,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
       iconPath!=null? InkWell(
         onTap: (){
           onClickEditIcon!()??(){};
         },
         child: Padding(
           padding:  EdgeInsets.only(left: 8.w),
           child: SvgPicture.asset(iconPath!),
         ),
       ):Container()
        // iconPath != null ? SvgPicture.asset(iconPath!) : Container()
      ],
    );
  }
}
