import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebViewScreenController extends GetxController {
  dynamic argumentData = Get.arguments;
  WebViewController? webViewController;
  bool isLoading = true;
  String? articlUrl;
  @override
  void onInit() {
    articlUrl = argumentData['articleLink'];

    // print(argumentData['articleLink']);
    // TODO: implement onInit
    super.onInit();
  }

  void stopLoading() {
    isLoading = false;
    update();
  }
}
