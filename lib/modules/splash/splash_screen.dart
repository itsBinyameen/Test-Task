
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/core/utils/asset_constants.dart';
import 'package:test_task/modules/splash/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Image.asset(
        AppAssets.splash,
        height: Get.height,
        width: Get.width,
        fit: BoxFit.cover,
      ),

    );
  }
}


