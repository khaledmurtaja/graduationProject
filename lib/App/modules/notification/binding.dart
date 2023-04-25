import 'package:get/get.dart';

import 'controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<NotificationScreenController>(
            () => NotificationScreenController());
  }
}
