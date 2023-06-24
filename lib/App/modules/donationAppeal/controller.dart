import 'package:blood4life/App/data/models/donationOfferModel.dart';
import 'package:blood4life/App/modules/donationAppeal/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../data/models/donationAppealModel.dart';

// selectedBloodUnit
// selectedAddress

class DonationAppealScreenController extends GetxController {
  TextEditingController searchBarController = TextEditingController();
  bool isAppealTabSelected = true;
  static const _pageSize = 15;
  final PagingController<int, DonationAppealModel> pagingControllerForAppeals =
      PagingController(firstPageKey: 1);
  final PagingController<int, DonationOfferModel> pagingControllerForOffers =
      PagingController(firstPageKey: 1);
  final repo = Get.find<DonationAppealRepository>();

  List<String> city = [
    "غزة",
    "بيت حانون",
    "بيت لاهيا",
    "الوسطى",
    "خانيونس",
    "رفح"
  ];

  ///this value will be changed according to the selected blood unit=>be default no unit is selected
  String selectedBloodUnit = "";
  String selectedAddress = "";

  /// if true the selected tab is the appeal
  /// if false the selected tab is the donations tab
  changeSelectedTab({required bool isAppealSelected}) {
    isAppealTabSelected = isAppealSelected;

    if (!isAppealTabSelected) {
      pagingControllerForOffers.addPageRequestListener((pageKey) {});
    }
    update();
  }

  changeSelectedAddress({required String valueSelectedAddress}) {
    selectedAddress = valueSelectedAddress;
    update();
  }

  /// change the selected blood unit
  changeSelectedBloodUnit({required String bloodUnit}) {
    selectedBloodUnit = bloodUnit;
    update();
  }

  @override
  void onInit() {
    pagingControllerForAppeals.addPageRequestListener((pageKey) async {
      print("object");
      await fetchAppealsData(pageKey: pageKey);
    });
    pagingControllerForOffers.addPageRequestListener((pageKey) async {
      await fetchOffersData(pageKey: pageKey);
    });
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

  filterAppealsData({
    required String bloodType,
    required String location,
    required bool oldestFirst,
  }) async {
    List<DonationAppealModel> appealsList = await repo.getAppeals(pageKey: 1);
    appealsList = appealsList.where((appeal) {
      return isAppealMatch(bloodType, location, appeal);
    }).toList();

    if (oldestFirst) {
      appealsList = appealsList.reversed.toList();
    }
    pagingControllerForAppeals.itemList = appealsList;

    update();
  }

  bool isAppealMatch(
    String bloodType,
    String location,
    DonationAppealModel appeal,
  ) {
    if (bloodType.isEmpty && location.isEmpty) {
      return true;
    } else if (bloodType.isNotEmpty && location.isNotEmpty) {
      return bloodType == appeal.bloodType.split('').reversed.join() &&
          location == appeal.location;
    } else if (bloodType.isEmpty && location.isNotEmpty) {
      return location == appeal.location;
    } else {
      return bloodType == appeal.bloodType.split('').reversed.join();
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

  filterOffersData({
    required String bloodType,
    required String location,
    required bool oldestFirst,
  }) async {
    List<DonationOfferModel> offersList = await repo.getOffers(pageKey: 1);
    offersList = offersList.where((offer) {
      return isOffersMatch(bloodType, location, offer);
    }).toList();

    if (oldestFirst) {
      offersList = offersList.reversed.toList();
    }
    pagingControllerForOffers.itemList = offersList;

    update();
  }

  bool isOffersMatch(
    String bloodType,
    String location,
    DonationOfferModel offer,
  ) {
    if (bloodType.isEmpty && location.isEmpty) {
      return true;
    } else if (bloodType.isNotEmpty && location.isNotEmpty) {
      return bloodType == offer.bloodType.split('').reversed.join() &&
          location == offer.location;
    } else if (bloodType.isEmpty && location.isNotEmpty) {
      return location == offer.location;
    } else {
      return bloodType == offer.bloodType.split('').reversed.join();
    }
  }
}
