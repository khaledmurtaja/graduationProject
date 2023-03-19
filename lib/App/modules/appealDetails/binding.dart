import 'package:get/get.dart';

import 'controller.dart';

class AppealDetailsBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AppealDetailsScreenController>(
        () => AppealDetailsScreenController());
  }
}
