import 'package:get/get.dart';

import 'controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<RegisterScreenController>(() => RegisterScreenController());
  }
}
