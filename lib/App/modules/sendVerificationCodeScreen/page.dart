import 'package:blood4life/App/widgets/customButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controller.dart';

class SendVerificationCodeScreen
    extends GetView<SendVerificationCodeController> {
  const SendVerificationCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تأكيد البريد الالكتروني'),
      ),
      body: GetBuilder<SendVerificationCodeController>(
        builder: (controller) {
          if (controller.isSendingCodeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Center(
                child: SizedBox(
                    height: 48.h,
                    child: CustomButton(
                      onPressed: () {
                        controller.sendEmailVerification();
                      },
                      text: 'ارسال رمز التحقق',
                    )));
          }
        },
      ),
    );
  }
}
