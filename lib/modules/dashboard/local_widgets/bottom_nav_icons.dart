import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarSelectedIcon extends StatelessWidget {
  const BottomBarSelectedIcon({required this.iconPath, this.height, super.key});

  final String? iconPath;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        iconPath ?? '',
        height: height ?? Get.height * 0.03,
        color: Colors.white,
      ),
    );
  }
}

class BottomBarUnSelectedIcon extends StatelessWidget {
  const BottomBarUnSelectedIcon({
    required this.iconPath,
    this.height,
    super.key,
  });

  final String? iconPath;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        iconPath ?? '',
        height: height ?? Get.height * 0.03,
        color: Colors.white,
      ),
    );
  }
}
