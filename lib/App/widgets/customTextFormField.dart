import 'package:flutter/material.dart';

import '../../core/values/colors.dart';

class CustomFormField extends StatelessWidget {
  Icon prefixIcon;
  Icon? suffixIcon;
  Function validator;
  Color backGroundColor;
  String hint;
  bool isPassword;
  double width;
  Color iconColor;

  CustomFormField(
      {required this.prefixIcon,
      this.suffixIcon,
      required this.validator,
      this.backGroundColor = textFormFieldColor,
      required this.hint,
      required this.isPassword,
      required this.width,
      this.iconColor = iconPrimaryColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.87,
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        validator: (value){
          validator();
        },
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            iconColor: iconPrimaryColor,
            border: InputBorder.none,
            hintText: hint),
      ),
    );
  }
}
