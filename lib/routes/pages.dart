import 'package:blood4life/App/modules/login/binding.dart';
import 'package:blood4life/App/modules/login/page.dart';
import 'package:blood4life/App/modules/register/binding.dart';
import 'package:blood4life/App/modules/register/page.dart';
import 'package:blood4life/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../App/modules/donationRequest/binding.dart';
import '../App/modules/donationRequest/page.dart';
import '../App/modules/home/binding.dart';
import '../App/modules/home/page.dart';
import '../App/modules/landingScreen/binding.dart';
import '../App/modules/landingScreen/page.dart';

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
        page: () => DonationRequestScreen(),
        bindings: [DonationRequestBinding()])
  ];
}
