// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/helperFunctions.dart';

class CustomListTile extends StatelessWidget {
  String leadingicon;
  String title;
  bool containsSwitch;
  bool? switchValue = true;
  bool? withTrailing;

  final Function(bool)? onChanged;
  final Function()? onTap;

  CustomListTile(
      {Key? key,
      required this.leadingicon,
      required this.title,
      this.containsSwitch = false,
      this.switchValue,
      this.withTrailing = true,
      this.onChanged,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          leadingicon,
        ),
        SizedBox(
          width: getMediaQueryWidth(context: context, value: 11),
        ),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12.spMin,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          width: getMediaQueryWidth(context: context, value: 110),
        ),
        containsSwitch
            ? Container(
                height: getMediaQueryWidth(context: context, value: 10),
                width: getMediaQueryWidth(context: context, value: 16),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: CupertinoSwitch(
                    value: switchValue!,
                    onChanged: onChanged,
                  ),
                ),
              )
            : withTrailing!
                ? GestureDetector(
                    onTap: onTap,
                    child: SvgPicture.asset(
                      "assets/images/icons/profile/turnBack.svg",
                    ),
                  )
                : Container(),
      ],
    );
  }
}
