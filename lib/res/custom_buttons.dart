import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final String btnName;
  final IconData? icon;
  const CustomButton(
      {super.key, required this.onTap, required this.btnName, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: Get.width * 0.85,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[500]!,
                offset: const Offset(4, 4),
                blurRadius: 6,
              ),
              BoxShadow(
                color: Colors.white,
                offset: const Offset(-4, -4),
                blurRadius: 6,
              ),
            ],
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              Text(btnName),
            ],
          )),
        ),
      ),
    );
  }
}
