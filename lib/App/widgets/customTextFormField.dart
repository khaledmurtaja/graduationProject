import 'package:flutter/material.dart';

import '../../core/values/colors.dart';

class CustomFormField extends StatelessWidget {
  Icon prefixIcon;
  IconButton? suffixIcon;
  Function validator;
  Color backGroundColor;
  String hint;
  bool isPassword;
  double width;
  Color iconColor;
  TextEditingController controller;
  TextEditingController? passwordConfirmController;

  CustomFormField(
      {required this.prefixIcon,
      this.suffixIcon,
      required this.validator,
      this.passwordConfirmController,
      this.backGroundColor = textFormFieldColor,
      required this.controller,
      required this.hint,
      required this.isPassword,
      required this.width,
      this.iconColor = iconPrimaryColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
          fillColor: backGroundColor,
          filled: true,
          suffixIcon: suffixIcon,
          iconColor: iconPrimaryColor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          hintText: hint),
    );
  }
}
