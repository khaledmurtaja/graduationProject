import 'package:get/get.dart';

import 'controller.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ResetPasswordScreenController>(
        () => ResetPasswordScreenController());
  }
}
