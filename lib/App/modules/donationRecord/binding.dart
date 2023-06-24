import 'package:blood4life/App/modules/donationRecord/repository.dart';
import 'package:get/get.dart';

import 'controller.dart';

class DonationRecordBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DonationRecordScreenController>(
        () => DonationRecordScreenController());
    Get.lazyPut<UserDonationDataRepository>(() => UserDonationDataRepository());
  }
}
