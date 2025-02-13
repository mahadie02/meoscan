import 'package:get/get.dart';
import '../bindings/home_binding.dart';
import '../views/home_page.dart';
import 'routes.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.homePage,
      binding: HomeBinding(),
      page: () => const HomePage(),
    ),
  ];
}
