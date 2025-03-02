import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart'; // new import

class SelectedImageView extends StatelessWidget {
  final String imagePath;
  const SelectedImageView({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Selected Image")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Wrap the image with a rounded rectangular dashed border and clip the image corners
          DottedBorder(
            dashPattern: const [8, 4],
            borderType: BorderType.RRect,
            radius: const Radius.circular(15),
            color: Colors.grey,
            strokeWidth: 2,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: Get.width * 0.85,
                maxHeight: Get.height * 0.7,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15), // new clipping
                child: imagePath.isNotEmpty
                    ? Image.file(File(imagePath), fit: BoxFit.contain)
                    : const Text("No image selected."),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Row of buttons below the image
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // scant text functionality
                },
                child: const Text("Scant Text"),
              ),
              ElevatedButton(
                onPressed: () {
                  // crop functionality
                },
                child: const Text("Crop"),
              ),
              ElevatedButton(
                onPressed: () {
                  // gallery functionality
                },
                child: const Text("Gallery"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
