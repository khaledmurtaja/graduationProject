import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgPic extends StatelessWidget {
  String picPath;

  SvgPic({super.key, required this.picPath});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      picPath,
      height: MediaQuery.of(context).size.height * 0.46,
    );
  }
}
