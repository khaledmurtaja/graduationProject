import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/helperFunctions.dart';

class NoNotificationsState extends StatelessWidget {
  const NoNotificationsState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/icons/no_notifications.svg",
              alignment: Alignment.center,
            ),
            SizedBox(
              height: getMediaQueryHeight(
                  context: context, value: 40),
            ),
            Text(
              'عذا لا يوجد أي إشعارات',
              style: TextStyle(
                  fontSize: 16.spMin,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      );
  }
}
