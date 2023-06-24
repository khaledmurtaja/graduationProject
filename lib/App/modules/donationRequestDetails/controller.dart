import 'package:blood4life/App/data/models/donationOfferModel.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class DonationRequestDetailsScreenController extends GetxController {
  dynamic argumentData = Get.arguments;
  DonationOfferModel? donationOfferModel;
  @override
  void onInit() {
    donationOfferModel = argumentData['DonationOfferModel'];
    // print(donationOfferModel!.bloodType);
    super.onInit();
  }

  Future<void> shareOffer({
    required DonationRequestDetailsScreenController
        donationRequestDetailsScreenController,
  }) async {
    Share.share(
        "متعافي مستعد للتبرع بالدم زمرة ${donationRequestDetailsScreenController.donationOfferModel!.bloodType} \n الاسم : ${donationRequestDetailsScreenController.donationOfferModel!.fullName} \n الهاتف : ${donationRequestDetailsScreenController.donationOfferModel!.phoneNumber} \n عافاكم الله وعافانا"
            .trim());
  }
}
