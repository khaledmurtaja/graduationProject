import 'package:blood4life/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../App/modules/landingScreen/binding.dart';
import '../App/modules/landingScreen/page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.LANDING_Page,
        page: () => LandingScreen(),
        bindings: [LandingBinding()]),
  ];
}
