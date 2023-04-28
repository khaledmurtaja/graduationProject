import 'package:blood4life/App/modules/register/repository.dart';
import 'package:get/get.dart';

import 'controller.dart';

class TermsAndPoliciesBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<TermsAndPoliciesScreenController>(
        () => TermsAndPoliciesScreenController());
  }
}
