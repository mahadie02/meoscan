import 'package:get/get.dart';

class HomeController extends GetxController {
  // Define your variables and methods here
  var count = 0.obs;

  void increment() {
    count++;
  }
}
