import 'package:get/get.dart';

import 'controller.dart';

class LandingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LandingPageController>(() => LandingPageController());  }
}