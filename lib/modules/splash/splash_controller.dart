
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/routes/routes.dart';

class SplashController extends GetxController{

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigateToNextScreen();
    });
  }

  Future<void> navigateToNextScreen()async{
    Future.delayed(const Duration(seconds: 3),() async{
        Get.offNamed(Routes.dashboardScreen);
    });

  }
}