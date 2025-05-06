import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Show {
  static void showSnackBar(String title, String message, {int? duration}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: duration ?? 2),
      colorText: Colors.black,
    );
  }

  static void showErrorSnackBar(String title, String error, {int? duration}) {
    Get.snackbar(
      title,
      error,
      overlayBlur: 1,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.yellow,
      colorText: Colors.black,
      icon: const Icon(Icons.error_outline, color: Colors.black),
      isDismissible: true,
      duration: Duration(seconds: duration ?? 4),
    );
  }

  static void showWarningSnackBar(String title, String error, {int? duration}) {
    Get.snackbar(
      title,
      error,
      overlayBlur: 1,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.orange.shade700,
      colorText: Colors.white,
      icon: const Icon(Icons.error_outline, color: Colors.white),
      isDismissible: true,
      duration: Duration(seconds: duration ?? 4),
    );
  }

  static void showLoader() {
    Get.dialog(
      const Center(child: CircularProgressIndicator.adaptive()),
      barrierDismissible: false,
    );
  }
}
