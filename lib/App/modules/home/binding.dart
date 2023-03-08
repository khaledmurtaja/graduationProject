import 'package:get/get.dart';

import 'controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
  }
}
