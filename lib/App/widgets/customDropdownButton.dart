// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/utils/helperFunctions.dart';
import '../../core/values/colors.dart';


class CustomDropdownButton extends StatelessWidget {
  String text;
  TextStyle textStyle;
  List<String> data;
  String? iconPath;
  double width;
  double height;
  CustomDropdownButton({
    Key? key,
    required this.data,
    required this.text,
    required this.textStyle,
     this.width=148,
    this.height=48,
     this.iconPath

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getMediaQueryWidth(context: context, value: width),
      height: getMediaQueryHeight(context: context, value: height),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        color: textFormFieldColor,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: null,
          isDense: true,
          items: data.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Row(
                children: <Widget>[
                  Text(value),
                ],
              ),
            );
          }).toList(),
          hint: Row(
            children: <Widget>[
             iconPath!=null? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: SvgPicture.asset(
                    "assets/images/icons/drop.svg",
                  )):Container(),
              Text(
                text,
                style:textStyle,
              ),
            ],
          ),
          onChanged: (String) {},
        ),
      ),
    );
  }
}
