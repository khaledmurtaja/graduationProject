import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/values/colors.dart';
import '../modules/EmailVerfication/controller.dart';

class OtpTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function? onchange;
  const OtpTextField({
    super.key,
    required this.controller,
    required this.onchange,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 52.h,
        width: 52.w,
        child: TextFormField(
          keyboardType: TextInputType.number,
          controller: controller,
          onChanged: (value) {
            onchange!(value);
          },
          style: TextStyle(fontSize: 24.spMin, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          showCursor: true,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
              filled: true,
              fillColor: scaffoldColor,
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: textFormFieldColor),
                  borderRadius: BorderRadius.circular(10)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.black)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.black)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.black)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.black))),
        ));
  }
}
