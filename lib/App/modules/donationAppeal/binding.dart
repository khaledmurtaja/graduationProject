import 'package:get/get.dart';

import 'controller.dart';

class DonationAppealBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DonationAppealScreenController>(
            () => DonationAppealScreenController());
  }
}
