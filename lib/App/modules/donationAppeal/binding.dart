import 'package:blood4life/App/modules/donationAppeal/repository.dart';
import 'package:get/get.dart';

import 'controller.dart';

class DonationAppealBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DonationAppealScreenController>(
        () => DonationAppealScreenController(),
        fenix: true);
    Get.lazyPut<DonationAppealRepository>(() => DonationAppealRepository(),fenix: true);
  }
}
