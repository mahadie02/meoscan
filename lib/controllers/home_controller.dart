import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'dart:math' as math;
import 'package:image_picker/image_picker.dart';
import 'package:meoscan/views/selected_image_view.dart';
import 'package:meoscan/views/qr_scanner_view.dart';

class HomeController extends GetxController {
  var count = 0.obs;
  CameraController? cameraController;
  RxList<CameraDescription> cameras = <CameraDescription>[].obs;
  RxBool isCamOn = false.obs;
  RxDouble rotationAngle = 0.0.obs;
  RxInt currentIndex = 0.obs;

  void _determineRotation(cam) {
    if (cameraController != null && cameraController!.value.isInitialized) {
      final description = cam;
      if (description.sensorOrientation == 90) {
        rotationAngle.value = math.pi / 2;
      } else if (description.sensorOrientation == 180) {
        rotationAngle.value = math.pi;
      } else if (description.sensorOrientation == 270) {
        rotationAngle.value = -math.pi / 2;
      } else {
        rotationAngle.value = 0;
      }
    }
  }

  Future<void> openCamera() async {
    final availableCams = await availableCameras();
    cameras.assignAll(availableCams);
    // Set initial camera index to 0
    currentIndex.value = 0;
    final selectedCam = cameras[currentIndex.value];
    if (cameras.isNotEmpty) {
      cameraController = CameraController(
        selectedCam,
        ResolutionPreset.high,
      );
    } else {
      print('No camera available');
    }
    try {
      await cameraController?.initialize();
      isCamOn.value = true;
      _determineRotation(selectedCam);
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  Future<void> switchCamera() async {
    if (cameras.isEmpty) return;
    // Toggle between first and last camera
    currentIndex.value = currentIndex.value == 0 ? cameras.length - 1 : 0;
    await cameraController?.dispose();
    final newCam = cameras[currentIndex.value];
    cameraController = CameraController(newCam, ResolutionPreset.high);
    try {
      await cameraController!.initialize();
      _determineRotation(newCam);
    } catch (e) {
      print('Error switching camera: $e');
    }
  }

  Future<void> closeCamera() async {
    if (cameraController != null) {
      await cameraController!.dispose();
      cameraController = null;
    }
    isCamOn.value = false;
    Get.back();
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Navigate to view the selected image
      Get.to(() => SelectedImageView(imagePath: pickedFile.path));
    } else {
      print('No image selected.');
    }
  }

  Future<void> scanQRCode() async {
    Get.to(() => const QRScannerView());
  }

  aspr() {
    print(cameraController!.value.aspectRatio);
    print(1 / Get.size.aspectRatio);
    print(Get.height / Get.width);
  }

  void increment() {
    count++;
  }
}
