import 'package:blood4life/App/modules/login/repository.dart';
import 'package:get/get.dart';

import 'controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<LoginScreenController>(() => LoginScreenController());
    Get.lazyPut<LoginRepository>(() => LoginRepository());

  }
}

