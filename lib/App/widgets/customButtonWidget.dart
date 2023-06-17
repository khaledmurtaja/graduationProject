import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/utils/helperFunctions.dart';
import '../../core/values/colors.dart';

///الزر هادا مستخدم بكل الشاشات
class CustomButton extends StatelessWidget {
  Function onPressed;
  String text;
  double? width;
  bool? showIcon;
  FontWeight? textBtnFontWeight;
  IconData? theIconBesideText;
  Color? buttonColor;

  CustomButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.width,
        this.theIconBesideText,
      this.showIcon = false,
        this.buttonColor,
      this.textBtnFontWeight = FontWeight.w500,  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color:buttonColor?? primaryColor),
        width: width ?? MediaQuery.of(context).size.width * 0.872,
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: !showIcon!
                ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    theIconBesideText!=null?Icon(theIconBesideText,color: Colors.white,):Container(),
                    Text(
                        text,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.spMin,
                            fontWeight: textBtnFontWeight),
                      ),
                  ],
                )
                : SvgPicture.asset(
                    "assets/images/icons/share.svg",
                  ),
          ),
        ),
      ),
    );
  }
}
