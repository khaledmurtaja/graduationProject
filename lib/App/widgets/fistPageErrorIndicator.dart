import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/helperFunctions.dart';
import 'customButtonWidget.dart';

class firstPageErrorIndicator extends StatelessWidget {
  dynamic controller;

  firstPageErrorIndicator(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "حدث خطأ ما",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.spMin),
        ),
        SizedBox(
          height: getMediaQueryHeight(context: context, value: 10),
        ),
        const Text(
          "التطبيق واجه مشكلة مجهولة",
        ),
        SizedBox(
          height: getMediaQueryHeight(context: context, value: 5),
        ),
        const Text("من فضلك حاول لاحقا او تأكد من الاتصال بالانترنت"),
        SizedBox(
          height: getMediaQueryHeight(context: context, value: 20),
        ),
        CustomButton(
            onPressed: () {
              controller.pagingController.retryLastFailedRequest();
            },
            text: "حاول مجددا",
            theIconBesideText: Icons.refresh)
      ],
    );
  }
}
