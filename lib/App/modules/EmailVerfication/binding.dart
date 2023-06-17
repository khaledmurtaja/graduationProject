import 'package:blood4life/App/modules/EmailVerfication/controller.dart';
import 'package:get/get.dart';

class EmailVerificationBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<EmailVerificationController>(
        () => EmailVerificationController());
  }
}
