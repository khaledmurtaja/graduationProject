import 'package:blood4life/App/modules/article/repository.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../data/models/articleModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleScreenController extends GetxController {
  static const _pageSize = 15;
  final PagingController<int, ArticleModel> pagingController =
      PagingController(firstPageKey: 0);
  final repo = Get.find<BlogRepository>();



  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) async {
      await fetchData(pageKey: pageKey);
    });
  }

  fetchData({required int pageKey}) async {
    try {
      final List<ArticleModel> newArticles =
          await repo.getArticles(pageKey: pageKey);
      final isLastPage = newArticles.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newArticles);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newArticles, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
}
