import 'package:get/get.dart';

import 'controller.dart';

class DonationRequestBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DonationRequestScreenController>(
        () => DonationRequestScreenController());
  }
}
