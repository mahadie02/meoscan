import 'package:camera/camera.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../res/app_data.dart';
import '../res/custom_buttons.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
      ),
      body: Obx(
        () => controller.isCamOn.value && controller.cameraController != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Transform.scale(
                      scale: 1.7,
                      child: Transform.rotate(
                        angle: controller.rotationAngle.value,
                        child: DottedBorder(
                          dashPattern: const [8, 4],
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(15),
                          color: Colors.grey,
                          strokeWidth: 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: AspectRatio(
                              aspectRatio: controller
                                  .cameraController!.value.aspectRatio,
                              child:
                                  CameraPreview(controller.cameraController!),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.27),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: controller.closeCamera,
                        icon: Icon(Icons.arrow_back_ios_new_rounded),
                        iconSize: 40,
                      ),
                      IconButton(
                        onPressed: controller.aspr,
                        icon: Icon(Icons.camera_outlined),
                        iconSize: 40,
                      ),
                      IconButton(
                        onPressed: controller.switchCamera,
                        icon: Icon(Icons.change_circle_outlined),
                        iconSize: 40,
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.035),
                ],
              )
            : Center(
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                      child: CustomButton(
                        onTap: controller.openCamera,
                        btnName: 'Camera',
                        icon: Icons.camera_alt_outlined,
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        onTap: controller.pickImage,
                        btnName: 'Gallery',
                        icon: Icons.image_outlined,
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        onTap: controller.scanQRCode,
                        btnName: 'Qr Scanner',
                        icon: Icons.qr_code_scanner_rounded,
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        onTap: () {},
                        btnName: 'Qr Generator',
                        icon: Icons.qr_code_rounded,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
      ),
      // floatingActionButton: CircularMenu(
      //   toggleButtonSize: btnSize,
      //   toggleButtonAnimatedIconData: AnimatedIcons.menu_close,
      //   curve: Curves.easeInOut,
      //   alignment: Alignment.bottomRight,
      //   items: [
      //     CircularMenuItem(
      //       icon: Icons.camera,
      //       onTap: controller.openCamera,
      //     ),
      //     CircularMenuItem(
      //       icon: Icons.image,
      //       onTap: controller.switchCamera,
      //     ),
      //     CircularMenuItem(
      //       icon: Icons.qr_code,
      //       onTap: () {},
      //     ),
      //   ],
      // ),
    );
  }
}
