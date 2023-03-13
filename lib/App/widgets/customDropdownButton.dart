// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/utils/helperFunctions.dart';
import '../../core/values/colors.dart';


class CustomDropdownButton extends StatelessWidget {
  List<String> data = ['A', 'B', 'C', 'D'];
  String text;
  CustomDropdownButton({
    Key? key,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getMediaQueryWidth(context: context, value: 148),
      height: getMediaQueryHeight(context: context, value: 48),
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
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: SvgPicture.asset(
                    "assets/images/icons/drop.svg",
                  )),
              Text(
                text,
                style: TextStyle(
                  fontSize: 20.spMin,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          onChanged: (String) {},
        ),
      ),
    );
  }
}
