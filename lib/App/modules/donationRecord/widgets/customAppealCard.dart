import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:blood4life/App/data/models/donationAppealModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/utils/helperFunctions.dart';
import '../../../../core/values/colors.dart';
import '../../../widgets/customRow.dart';

class CustomAppealCard extends StatelessWidget {
  DonationAppealModel donationAppealModel;
  String? iconPath;
  Function onDelete;
  Function onEdit;
  CustomAppealCard({
    required this.donationAppealModel,
    this.iconPath,
    required this.onDelete,
    required this.onEdit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            extentRatio: 1,
            children: [
              SlidableAction(
                onPressed: (c) {
                  customDialog(
                          context: context,
                          title: 'هل تريد حذف المناشدة؟',
                          dialogType: DialogType.question,
                          btnOkText: "حذف المناشدة",
                          onDismissCallback: () {},
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {
                            onDelete();
                          })
                      .show();
                },
                icon: Icons.delete_sharp,
                backgroundColor: primaryColor,
                borderRadius: BorderRadius.circular(8),
              )
            ],
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            color: textFormFieldColor,
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.only(
                  top: getMediaQueryHeight(context: context, value: 8),
                  bottom: getMediaQueryHeight(context: context, value: 8),
                  right: getMediaQueryWidth(context: context, value: 8)),
              child: Column(
                children: [
                  CustomRow(
                    firstText: 'رقم العملية :',
                    secondText: '# ${donationAppealModel.operationId}',
                    firstTextFontWeight: FontWeight.w500,
                    secondTextFontSize: 12.spMin,
                    iconPath: iconPath,
                    onClickEditIcon: onEdit,
                  ),
                  SizedBox(
                    height: getMediaQueryHeight(context: context, value: 8),
                  ),
                  CustomRow(
                    firstText: 'المحتاج :',
                    secondText: donationAppealModel.fullName,
                    firstTextFontWeight: FontWeight.w500,
                    secondTextFontSize: 12.spMin,
                  ),
                  SizedBox(
                    height: getMediaQueryHeight(context: context, value: 8),
                  ),
                  CustomRow(
                    firstText: 'رقم هاتف المحتاج:',
                    secondText: donationAppealModel.phoneNumber,
                    firstTextFontWeight: FontWeight.w500,
                    secondTextFontSize: 12.spMin,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
