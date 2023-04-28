import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../widgets/customAppBar.dart';
import 'controller.dart';

class ArticleWebViewScreen extends GetView<ArticleWebViewScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        function: () {
          Get.back();
        },
        title: 'مدونتي',
      ),
      body: GetBuilder(builder: (ArticleWebViewScreenController controller) {
        return Stack(
          children: [
            WebView(
              initialUrl: controller.articlUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controllerWebView) {
                controller.webViewController = controllerWebView;
              },
              onPageFinished: (url) {
                controller.stopLoading();
              },
            ),
            controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(),
          ],
        );
      }),
    );
  }
}
