import 'package:flutter/material.dart';

import '../../core/values/colors.dart';

class CustomFormField extends StatelessWidget {
  Icon? prefixIcon;
  IconButton? suffixIcon;
  Function validator;
  Function? onFieldSubmitted;
  Color backGroundColor;
  String? hint;
  int? maxLength;
  bool isPassword;
  double width;
  double? height;
  Color iconColor;
  TextInputType? textInputType;
  TextEditingController controller;
  TextEditingController? passwordConfirmController;
  int? maxLines;
  int minLines;
  FocusNode? focusNode;

  CustomFormField(
      {this.prefixIcon,
      this.suffixIcon,
      required this.validator,
      this.onFieldSubmitted,
      this.maxLength,
      this.passwordConfirmController,
      this.backGroundColor = textFormFieldColor,
      required this.controller,
      this.hint,
      this.maxLines = 1,
      this.minLines = 1,
      required this.isPassword,
      required this.width,
      this.textInputType,
      this.focusNode,
      this.height,
      this.iconColor = iconPrimaryColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      textAlignVertical: TextAlignVertical.top,
      keyboardType: textInputType,
      style: const TextStyle(height: 1.5),
      onFieldSubmitted: (tap) {
        onFieldSubmitted!();
      },
      selectionControls: MaterialTextSelectionControls(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      focusNode: focusNode,
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
          errorMaxLines: 2,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: primaryColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: primaryColor)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: primaryColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: textFormFieldColor)),
          hintText: hint),
    );
  }
}
