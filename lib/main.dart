import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'res/app_pages.dart';
import 'res/routes.dart';
//import 'res/theme.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(const MeoScan());
}

class MeoScan extends StatelessWidget {
  const MeoScan({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //defaultTransition: Transition.noTransition,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homePage,
      getPages: AppPages.pages,
    );
  }
}
