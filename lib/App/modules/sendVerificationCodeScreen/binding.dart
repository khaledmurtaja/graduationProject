import 'package:blood4life/App/modules/sendVerificationCodeScreen/controller.dart';
import 'package:get/get.dart';

class SendVerificationCodeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SendVerificationCodeController>(
        () => SendVerificationCodeController(),
        fenix: true);
  }
}
