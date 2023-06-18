import 'package:get/get.dart';

import 'controller.dart';

class ForgottenPasswordVerificationBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ForgottenPasswordVerificationController>(
        () => ForgottenPasswordVerificationController());
  }
}
