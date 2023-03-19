import 'package:get/get.dart';

import 'controller.dart';

class PersonalInformationBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<PersonalInformationScreenController>(() => PersonalInformationScreenController());  }
}

