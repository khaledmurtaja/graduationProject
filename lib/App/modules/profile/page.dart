// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:blood4life/App/modules/profile/controller.dart';
import 'package:blood4life/App/modules/profile/widgets/customListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blood4life/App/modules/profile/widgets/customCard.dart';
import 'package:get/get.dart';

import '../../../core/utils/helperFunctions.dart';
import '../../../core/values/colors.dart';

class ProfileScreen extends GetView<ProfileScreenController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'صفحتي ',
          style: TextStyle(
              fontSize: 24.spMin,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomCard(),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 16),
            ),
            Text(
              'معلوماتي',
              style: TextStyle(
                  fontSize: 16.spMin,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 17),
            ),
            CustomListTile(
              leadingicon: "assets/images/icons/profile/person.svg",
              title: 'معلوماتي الشخصية',
              onTap: () {
                Get.toNamed("/personalInformation");
              },
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 8),
            ),
            const Divider(
              color: dividerColor,
              height: .5,
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 8),
            ),
            CustomListTile(
              leadingicon: "assets/images/icons/profile/note.svg",
              title: 'سجل التبرع',
              onTap: () {
                Get.toNamed("/donationRecord");
              },
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 8),
            ),
            const Divider(
              color: dividerColor,
              height: .5,
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 8),
            ),
            GetBuilder(builder: (ProfileScreenController controller) {
              return CustomListTile(
                leadingicon: "assets/images/icons/profile/bucket.svg",
                title: 'جاهز للتبرع',
                containsSwitch: true,
                switchValue: controller.switchValueReadytoDonate,
                onChanged: controller.toggleReadytoDonate,
              );
            }),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 24),
            ),
            Text(
              'السياسات والخصوصية',
              style: TextStyle(
                  fontSize: 16.spMin,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 16),
            ),
            CustomListTile(
              leadingicon: "assets/images/icons/profile/passwordcheck.svg",
              title: 'إعادة تعين كلمة المرور',
              onTap: () {
                Get.toNamed("/resetPassword");
              },
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 8),
            ),
            const Divider(
              color: dividerColor,
              height: .5,
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 8),
            ),
            CustomListTile(
              leadingicon: "assets/images/icons/profile/conditions.svg",
              title: 'الشروط والسياسات',
              onTap: () {},
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 16),
            ),
            Text(
              'الإعدادات',
              style: TextStyle(
                  fontSize: 16.spMin,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 17),
            ),
            GetBuilder(builder: (ProfileScreenController controller) {
              return CustomListTile(
                leadingicon: "assets/images/icons/profile/notification.svg",
                title: 'الإشعارات',
                containsSwitch: true,
                switchValue: controller.switchValueNotification,
                onChanged: controller.toggleNotification,
              );
            }),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 8),
            ),
            const Divider(
              color: dividerColor,
              height: .5,
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 8),
            ),
            CustomListTile(
              leadingicon: "assets/images/icons/profile/call.svg",
              title: 'تواصل معنا',
              onTap: () {},
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 8),
            ),
            const Divider(
              color: dividerColor,
              height: .5,
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 8),
            ),
            CustomListTile(
              leadingicon:
                  "assets/images/icons/profile/mdi_warning-circle-outline.svg",
              title: 'من نحن',
              onTap: () {},
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 57),
            ),
            GestureDetector(
              onTap: () {
                customDialog(
                    context: context,
                    title: "هل انت متأكد من انك ترغب في تسجيل الخروج؟",
                    controller: controller,
                    dialogType: DialogType.question,
                    onDismissCallback: () {},
                    btnCancelOnPress: () {},
                    btnOkText: "تسجيل الخروج",
                    btnOkOnPress: () async {
                      Get.dialog(
                          AlertDialog(
                        title: const Text("جاري تسجيل خروجك"),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                             CircularProgressIndicator(),
                          ],
                        ),
                      ),
                        barrierDismissible: false
                      );
                      await controller.logOutUser();
                    }).show();
              },
              child: CustomListTile(
                leadingicon: "assets/images/icons/profile/logoutcurve.svg",
                title: 'تسجيل الخروج',
                withTrailing: false,
              ),
            ),
            SizedBox(
              height: getMediaQueryHeight(context: context, value: 20),
            ),
          ],
        ),
      ),
    );
  }
}
