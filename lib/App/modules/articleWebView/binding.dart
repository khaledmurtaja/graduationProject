import 'package:blood4life/App/modules/article/repository.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ArticleWebViewBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ArticleWebViewScreenController>(
        () => ArticleWebViewScreenController());
  }
}
