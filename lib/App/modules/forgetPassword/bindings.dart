import 'package:blood4life/App/modules/forgetPassword/controller.dart';
import 'package:get/get.dart';

class ForgetPasswordBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ForgetPasswordScreenController>(
            () => ForgetPasswordScreenController(),
        fenix: false);
  }

}