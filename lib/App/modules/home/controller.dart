import 'package:blood4life/App/modules/home/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../core/values/strings.dart';
import '../../data/models/donationAppealModel.dart';
import '../../data/services/sharedPrefService.dart';
import '../blog/page.dart';
import '../donationAppeal/page.dart';
import '../notification/page.dart';
import '../profile/page.dart';
import 'homePageContent.dart';

class HomeScreenController extends GetxController {
  int currentPageIndex = 0;
  int currentBannerIndex = 0;
  bool? isLoggedIn = Get.find<AppSharedPref>().getBoolValue(key: loginPageKey);
  final repo = Get.find<HomeRepository>();
  bool blurScreen = false;
  static const _pageSize = 15;
  final PagingController<int, DonationAppealModel> pagingController =
      PagingController(firstPageKey: 0);
  List<Widget> pages = [
    HomeScreenContent(),
    const AppealScreen(),
    NotificationScreen(),
    const BlogScreen(),
    const ProfileScreen()
  ];

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) async {
      print(pageKey);
      print("object");
      await fetchData(pageKey: pageKey);
    });
  }

  fetchData({required int pageKey}) async {
    try {
      final List<DonationAppealModel> newAppeals =
          await repo.getAppeals(pageKey: pageKey);
      final isLastPage = newAppeals.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newAppeals);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newAppeals, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  changeCurrentBannerIndex(int index) {
    currentBannerIndex = index;
    update();
  }

  changeCurrentPageIndex(int index) {
    currentPageIndex = index;
    update();
  }

  blurScreenFun(bool isBlur) {
    blurScreen = isBlur;
    update();
  }
}
