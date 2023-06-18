// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/helperFunctions.dart';
import '../../core/values/colors.dart';

class CustomAppBar  extends StatelessWidget implements PreferredSizeWidget {

  String title;
  final VoidCallback function;

  CustomAppBar({
    required this.title,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      titleSpacing: 0,
      centerTitle: false,
      title: Row(
        children: [
          SizedBox(
            width: getMediaQueryWidth(context: context, value: 24),
          ),
          GestureDetector(
            onTap: function,
            child: SvgPicture.asset(
              "assets/images/icons/turnBack.svg",
              width: 24,
              height: 24,
            ),
          ),
          SizedBox(
            width: getMediaQueryWidth(context: context, value: 8),
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 20.spMin,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
