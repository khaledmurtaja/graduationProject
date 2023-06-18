import 'package:get/get.dart';

import 'controller.dart';

class EmailVerificationBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<EmailVerificationController>(
        () => EmailVerificationController());
  }
}
