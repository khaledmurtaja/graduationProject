import 'package:blood4life/core/utils/helperFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/values/colors.dart';

class CustomSearchBar extends StatelessWidget {
  TextEditingController searchBarController;
  bool readOnly;
  Function? function;
  CustomSearchBar({super.key, required this.searchBarController,this.readOnly=false,this.function});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getMediaQueryHeight(context: context, value: 40),
      child: TextFormField(
        autofocus: true,
        readOnly: readOnly,
        onTap: (){
          function!();
        },
        controller: searchBarController,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: textFormFieldColor),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: textFormFieldColor),
                borderRadius: BorderRadius.circular(10)),
            hintText: "بحث",
            fillColor: textFormFieldColor,
            filled: true,
            prefixIcon: SvgPicture.asset(
              "assets/images/icons/searchnormal1.svg",
              fit: BoxFit.scaleDown,
            )),
      ),
    );
  }
}
