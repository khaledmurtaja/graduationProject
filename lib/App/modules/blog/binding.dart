import 'package:get/get.dart';

import 'controller.dart';

class BlogBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<BlogScreenController>(
            () => BlogScreenController());
  }

}