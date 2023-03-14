import 'package:get/get.dart';

import 'controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ProfileScreenController>(() => ProfileScreenController());
  }
}
