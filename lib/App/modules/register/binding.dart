import 'package:blood4life/App/modules/register/repository.dart';
import 'package:get/get.dart';

import 'controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<RegisterScreenController>(() => RegisterScreenController());
    Get.lazyPut<RegisterRepository>(() => RegisterRepository());
  }
}
