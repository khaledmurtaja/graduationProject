import 'package:blood4life/App/modules/home/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../core/values/strings.dart';
import '../../data/models/campaignModel.dart';
import '../../data/models/donationAppealModel.dart';
import '../../data/services/sharedPrefService.dart';
import '../article/page.dart';
import '../donationAppeal/page.dart';
import '../notification/page.dart';
import '../profile/page.dart';
import 'homePageContent.dart';

class HomeScreenController extends GetxController {
  int currentPageIndex = 0;
  int currentBannerIndex = 0;
  bool? isLoggedIn = Get.find<AppSharedPref>().getBoolValue(key: loginPageKey);
  bool? isUserVerified =
      Get.find<AppSharedPref>().getBoolValue(key: isEmailVerifiedKey);
  final repo = Get.find<HomeRepository>();
  bool blurScreen = false;
  static const _pageSize = 15;
  String? errorMessage = '';

  final PagingController<int, DonationAppealModel> pagingController =
      PagingController(firstPageKey: 1);
  List<Widget> pages = [
    HomeScreenContent(),
    const AppealScreen(),
    NotificationScreen(),
    const ArticleScreen(),
    const ProfileScreen()
  ];
  List<CampaignModel>? campaigns;
  bool campaignsIsLoading = false;
  @override
  void onInit(){
     fetchCampaigns();
    pagingController.addPageRequestListener((pageKey) async {
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

  updateErrorMessage(String message) {
    errorMessage = message;
    update();
  }

 Future<void> fetchCampaigns() async {
    campaignsIsLoading = true;
    campaigns = await repo.getCampaigns();

    campaignsIsLoading = false;
    update();
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
