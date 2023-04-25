import 'package:blood4life/App/modules/profile/repository.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ProfileScreenController>(() => ProfileScreenController(),fenix: true);
    Get.lazyPut<ProfileRepository>(() => ProfileRepository(),fenix: true);
  }
}
