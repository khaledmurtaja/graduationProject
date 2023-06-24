import 'package:blood4life/App/modules/donationUpdateForm/repository.dart';
import 'package:get/get.dart';
import 'controller.dart';

class DonationUpdateFormBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DonationUpdateFormScreenController>(
        () => DonationUpdateFormScreenController());
    Get.lazyPut<DonationUpdateFormRepository>(() => DonationUpdateFormRepository());
  }
}
