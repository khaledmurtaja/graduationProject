import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/values/colors.dart';

class CustomTextButton extends StatelessWidget {
  String text;
  Function function;
  double fontSize;
  Color color;

  CustomTextButton({required this.text,required this.function, this.fontSize=12, this.color=textBtnColor});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      child:  Text(text,style: TextStyle(fontSize: fontSize.spMin,color: color,fontWeight: FontWeight.w400),),
      onTap: (){
        function();
      },
    );
  }
}
