import 'package:blood4life/App/modules/login/binding.dart';
import 'package:blood4life/App/modules/login/page.dart';
import 'package:blood4life/App/modules/register/binding.dart';
import 'package:blood4life/App/modules/register/page.dart';
import 'package:blood4life/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../App/modules/appealDetails/binding.dart';
import '../App/modules/appealDetails/page.dart';
import '../App/modules/donationForm/binding.dart';
import '../App/modules/donationForm/page.dart';
import '../App/modules/donationRecord/binding.dart';
import '../App/modules/donationRecord/page.dart';
import '../App/modules/donationRequestDetails/binding.dart';
import '../App/modules/donationRequestDetails/page.dart';
import '../App/modules/home/binding.dart';
import '../App/modules/home/page.dart';
import '../App/modules/landingScreen/binding.dart';
import '../App/modules/landingScreen/page.dart';
import '../App/modules/personalInformation/binding.dart';
import '../App/modules/personalInformation/page.dart';
import '../App/modules/resetPassword/binding.dart';
import '../App/modules/resetPassword/page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.LANDING_Page,
        page: () => LandingScreen(),
        bindings: [LandingBinding()]),
    GetPage(
        name: Routes.HOME, page: () => HomeScreen(), bindings: [HomeBinding()]),
    GetPage(
        name: Routes.LOGIN,
        page: () => LoginScreen(),
        bindings: [LoginBinding()]),
    GetPage(
        name: Routes.REGISTER,
        page: () => RegisterScreen(),
        bindings: [RegisterBinding()]),
    GetPage(
      name: Routes.DONATION_REQUESTS,
      page: () => DonationFormScreen(),
      bindings: [DonationFormBinding()],
    ),
    GetPage(
      name: Routes.PERSONAL_INFORMATION,
      page: () => PersonalInformationScreen(),
      bindings: [PersonalInformationBinding()],
    ),
    GetPage(
      name: Routes.DONATION_RECORD,
      page: () => DonationRecordScreen(),
      bindings: [DonationRecordBinding()],
    ),
    GetPage(
      name: Routes.RESET_PASSWORD,
      page: () => ResetPasswordScreen(),
      bindings: [ResetPasswordBinding()],
    ),
    GetPage(
      name: Routes.DONATION_REQUEST_DETAILS,
      page: () => DonationRequestDetailsScreen(),
      bindings: [DonationRequestDetailsBinding()],
    ),
    GetPage(
      name: Routes.APPEAL_DETAILS,
      page: () => AppealDetailsScreen(),
      bindings: [AppealDetailsBinding()],
    ),
  ];
}
