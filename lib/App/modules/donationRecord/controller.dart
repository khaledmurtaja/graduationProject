import 'package:blood4life/App/modules/donationRecord/repository.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../data/models/donationAppealModel.dart';
import '../../data/models/donationOfferModel.dart';

class DonationRecordScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  bool isAppealTabSelected = true;
  late DonationAppealModel donationAppealModel;
  late DonationOfferModel donationOfferModel;
  final PagingController<int, DonationAppealModel> pagingControllerForAppeals =
      PagingController(firstPageKey: 1);
  final PagingController<int, DonationOfferModel> pagingControllerForOffers =
      PagingController(firstPageKey: 1);
  static const _pageSize = 15;
  final repo = Get.find<UserDonationDataRepository>();

  @override
  void onInit() {
    pagingControllerForAppeals.addPageRequestListener((pageKey) async {
      await fetchAppealsData(pageKey: pageKey);
    });
    pagingControllerForOffers.addPageRequestListener((pageKey) async {
      await fetchOffersData(pageKey: pageKey);
    });
  }

  changeSelectedTab({required bool isAppealSelected}) {
    isAppealTabSelected = isAppealSelected;
    if (!isAppealTabSelected) {
      pagingControllerForOffers.addPageRequestListener((pageKey) {});
    }
    update();
  }

  fetchAppealsData({required int pageKey}) async {
    try {
      final List<DonationAppealModel> newAppeals =
          await repo.getAppeals(pageKey: pageKey);
      final isLastPage = newAppeals.length < _pageSize;
      if (isLastPage) {
        pagingControllerForAppeals.appendLastPage(newAppeals);
      } else {
        final nextPageKey = pageKey + 1;
        pagingControllerForAppeals.appendPage(newAppeals, nextPageKey);
      }
    } catch (error) {
      pagingControllerForAppeals.error = error;
    }
  }

  fetchOffersData({required int pageKey}) async {
    final List<DonationOfferModel> newOffers =
        await repo.getOffers(pageKey: pageKey);
    final isLastPage = newOffers.length < _pageSize;
    if (isLastPage) {
      pagingControllerForOffers.appendLastPage(newOffers);
    } else {
      final nextPageKey = pageKey + 1;
      pagingControllerForOffers.appendPage(newOffers, nextPageKey);
    }
  }

  deleteAppeal({required dynamic appealId}) async {
    await repo.deleteAppeal(appealId: appealId);
  }
  deleteOffer({required dynamic offerId}) async {
    await repo.deleteOffer(offerId: offerId);
  }
}
