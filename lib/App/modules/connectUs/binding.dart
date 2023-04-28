import 'package:get/get.dart';

import 'controller.dart';

class ConnectUsBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ConnectUsScreenController>(() => ConnectUsScreenController());
  }
}
