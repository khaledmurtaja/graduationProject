import 'package:flutter/material.dart';

import '../../core/values/colors.dart';

class CustomFormField extends StatelessWidget {
  Icon? prefixIcon;
  IconButton? suffixIcon;
  Function validator;
  Color backGroundColor;
  String? hint;
  bool isPassword;
  double width;
  double? height;
  Color iconColor;
  TextInputType? textInputType;
  TextEditingController controller;
  TextEditingController? passwordConfirmController;
  int maxLines;
  int minLines;

  CustomFormField(
      {this.prefixIcon,
      this.suffixIcon,
      required this.validator,
      this.passwordConfirmController,
      this.backGroundColor = textFormFieldColor,
      required this.controller,
      this.hint,
      this.maxLines = 1,
      this.minLines = 1,
      required this.isPassword,
      required this.width,
      this.textInputType,
      this.height,
      this.iconColor = iconPrimaryColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      maxLines: maxLines,
      textAlignVertical: TextAlignVertical.top,
      keyboardType: textInputType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: (value) {
        if (passwordConfirmController != null) {
          return validator(value, passwordConfirmController);
        } else {
          return validator(value);
        }
      },
      obscureText: isPassword,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
              bottom: height ?? 0, top: 15, right: 15, left: 15),
          fillColor: backGroundColor,
          filled: true,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          iconColor: iconPrimaryColor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          hintText: hint),
    );
  }
}
