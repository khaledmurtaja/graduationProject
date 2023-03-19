import 'package:blood4life/App/modules/donationRecord/widgets/customCard.dart';
import 'package:blood4life/App/modules/donationRecord/widgets/customRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/helperFunctions.dart';
import '../../../core/values/colors.dart';
import '../../widgets/customAppBar.dart';

class DonationRecordScreen extends StatelessWidget {
  const DonationRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        function: () {}, 
        title: 'سجل التبرع ',
      ),
      body: false
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/icons/recordEmpty.svg",
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: getMediaQueryHeight(context: context, value: 40),
                  ),
                  Text(
                    'عذا لا يوجد أي عمليات تبرع',
                    style: TextStyle(
                        fontSize: 16.spMin, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: getMediaQueryWidth(context: context, value: 24),
                  right: getMediaQueryWidth(context: context, value: 24),
                  top: getMediaQueryWidth(context: context, value: 16),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) => CustomCard(),
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: getMediaQueryHeight(context: context, value: 8),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
