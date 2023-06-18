import 'package:get/get.dart';

import 'controller.dart';

class ResetForgottenPasswordBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ResetForgottenPasswordScreenController>(
        () => ResetForgottenPasswordScreenController());
  }
}
