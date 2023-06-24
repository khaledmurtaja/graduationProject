// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/utils/helperFunctions.dart';
import '../../core/values/colors.dart';

class CustomDropdownButton extends StatelessWidget {
  TextStyle textStyle;
  List<String> data;
  String? iconPath;
  double width;
  double height;
  Color? backGroundColor;
  String? defaultValue;
  Function(String)? onChange;
  CustomDropdownButton(
      {Key? key,
        this.backGroundColor=textFormFieldColor,
      required this.data,
      required this.textStyle,
      required this.onChange,
      this.width = 148,
      this.height = 48,
        this.defaultValue,
      this.iconPath})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          value: defaultValue,
          isExpanded: true,
          validator: (value) {
            return validateDropDown(value);
          },
          icon: Container(),
          menuMaxHeight: getMediaQueryHeight(context: context, value: 250),
          decoration: InputDecoration(
            fillColor: backGroundColor,
            filled: true,
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
            suffixIcon: IconButton(
              icon: SvgPicture.asset("assets/images/icons/arrowright2.svg"),
              onPressed: null,
            ),
            prefixIcon: SvgPicture.asset(
              iconPath!,
              height: getMediaQueryHeight(context: context, value: 24),
              fit: BoxFit.scaleDown,
            ),
          ),
          items: data.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Center(
                child: FittedBox(
                  child: Row(
                    children: <Widget>[
                      Text(
                        value,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            onChange!(value!);
          },
        ),
      ),
    );
  }
}
