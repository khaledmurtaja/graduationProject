import 'package:get/get.dart';

import 'controller.dart';

class DonationFormBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DonationFormScreenController>(
        () => DonationFormScreenController());
  }
}
