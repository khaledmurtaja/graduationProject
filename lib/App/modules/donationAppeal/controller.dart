import 'package:blood4life/App/modules/donationAppeal/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../data/models/donationAppealModel.dart';

class DonationAppealScreenController extends GetxController {
  TextEditingController searchBarController = TextEditingController();
  bool isAppealTabSelected = true;
  static const _pageSize = 15;
  final PagingController<int, DonationAppealModel> pagingController =
  PagingController(firstPageKey: 1);
  final repo = Get.find<DonationAppealRepository>();

  List<String> city=[
    "غزة",
    "بيت حانون",
    "بيت لاهيا",
    "الوسطى",
    "خانيونس",
    "رفح"
  ];


  ///this value will be changed according to the selected blood unit=>be default no unit is selected
  String selectedBloodUnit = "";

  /// if true the selected tab is the appeal
  /// if false the selected tab is the donations tab
  changeSelectedTab({required bool isAppealSelected}) {
    isAppealTabSelected = isAppealSelected;
    update();
  }

  /// change the selected blood unit
  changeSelectedBloodUnit({required String bloodUnit}) {
    selectedBloodUnit = bloodUnit;
    update();
  }
  @override
  void onInit() {
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

}
