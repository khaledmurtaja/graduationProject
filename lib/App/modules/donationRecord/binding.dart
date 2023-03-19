import 'package:get/get.dart';

import 'controller.dart';

class DonationRecordBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DonationRecordScreenController>(
        () => DonationRecordScreenController());
  }
}
