import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/donationAppealModel.dart';

class AppealDetailsScreenController extends GetxController {
  dynamic argumentData = Get.arguments;
  DonationAppealModel? donationAppealModel;
  @override
  void onInit() {
    donationAppealModel = argumentData['DonationAppealModel'];
    print(donationAppealModel!.bloodType);
    super.onInit();
  }



  Future<void> shareAppeal(
      {required AppealDetailsScreenController
          appealDetailsScreenController ,}) async {
    final bytes = await rootBundle.load('assets/images/test/appealImage.jpg');
    final list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/image.jpg').create();
    file.writeAsBytesSync(list);
    Share.shareXFiles([XFile(file.path)],
        text:
            '''مريض بحاجة الى تبرع بالدم زمرة ${appealDetailsScreenController.donationAppealModel!.bloodType} \nاسم المريض : ${appealDetailsScreenController.donationAppealModel!.fullName}\n الهاتف : ${appealDetailsScreenController.donationAppealModel!.phoneNumber}\n وأجركم على الله'''
                .trim());
  }

}
