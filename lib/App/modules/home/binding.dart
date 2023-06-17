import 'package:blood4life/App/modules/home/repository.dart';
import 'package:get/get.dart';

import 'controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeScreenController>(
      () => HomeScreenController(),fenix: true
    );
    Get.lazyPut<HomeRepository>(
        () => HomeRepository());
  }
}
