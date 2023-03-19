import 'package:get/get.dart';

import 'controller.dart';

class DonationRequestDetailsBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DonationRequestDetailsScreenController>(
        () => DonationRequestDetailsScreenController());
  }
}
