import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          //child: Obx(() => Text('Count: ${controller.count}')),
          ),
      floatingActionButton: CircularMenu(
        toggleButtonAnimatedIconData: AnimatedIcons.menu_close,
        curve: Curves.easeInOut,
        alignment: Alignment.bottomRight,
        items: [
          CircularMenuItem(
            icon: Icons.camera,
            onTap: controller.increment,
          ),
          CircularMenuItem(
            icon: Icons.image,
            onTap: () {},
          ),
          CircularMenuItem(
            icon: Icons.qr_code,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
