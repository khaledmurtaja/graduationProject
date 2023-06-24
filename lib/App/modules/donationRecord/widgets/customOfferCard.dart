import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:blood4life/App/data/models/donationOfferModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/utils/helperFunctions.dart';
import '../../../../core/values/colors.dart';
import '../../../widgets/customRow.dart';

class CustomOfferCard extends StatelessWidget {
  DonationOfferModel donationOfferModel;
  String? iconPath;
  Function onDelete;
  Function onEdit;
  CustomOfferCard({
    required this.donationOfferModel,
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
                      title: 'هل تريد حذف عرض التبرع؟',
                      dialogType: DialogType.question,
                      btnOkText: "حذف عرض التبرع",
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
                    secondText: '# ${donationOfferModel.operationId}',
                    firstTextFontWeight: FontWeight.w500,
                    secondTextFontSize: 12.spMin,
                    iconPath: iconPath,
                    onClickEditIcon: onEdit,
                  ),
                  SizedBox(
                    height: getMediaQueryHeight(context: context, value: 8),
                  ),
                  CustomRow(
                    firstText: 'المتبرع :',
                    secondText: donationOfferModel.fullName,
                    firstTextFontWeight: FontWeight.w500,
                    secondTextFontSize: 12.spMin,
                  ),
                  SizedBox(
                    height: getMediaQueryHeight(context: context, value: 8),
                  ),
                  CustomRow(
                    firstText: 'رقم هاتف المتبرع:',
                    secondText: donationOfferModel.phoneNumber,
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
