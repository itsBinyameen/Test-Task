import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/core/utils/asset_constants.dart';
import 'package:test_task/modules/dashboard/dashboard_controller.dart';
import 'package:test_task/modules/dashboard/local_widgets/bottom_nav_icons.dart';

class BottomNavigationScreen extends GetView<DashboardController> {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        elevation: 5,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,

        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,

        selectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 11),
        unselectedLabelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 11,
        ),
        items: [
          BottomNavigationBarItem(
            label: "Products",
            icon: BottomBarUnSelectedIcon(
              iconPath: AppAssets.productIcon,
              height: Get.height * 0.035,
            ),
            activeIcon: BottomBarSelectedIcon(
              iconPath: AppAssets.productIcon,
              height: Get.height * 0.035,
            ),
          ),

          BottomNavigationBarItem(
            label: "Categories".tr,
            icon: BottomBarUnSelectedIcon(iconPath: AppAssets.categoryIcon),
            activeIcon: BottomBarSelectedIcon(iconPath: AppAssets.categoryIcon),
          ),
          BottomNavigationBarItem(
            label: "Favourities".tr,
            icon: BottomBarUnSelectedIcon(iconPath: AppAssets.favIcon),
            activeIcon: BottomBarSelectedIcon(iconPath: AppAssets.favIcon),
          ),
          BottomNavigationBarItem(
            label: "Mitt Konto".tr,
            icon: BottomBarUnSelectedIcon(iconPath: AppAssets.profileIcon),
            activeIcon: BottomBarSelectedIcon(iconPath: AppAssets.profileIcon),
          ),
        ],
        currentIndex: controller.currentPage.value,
        onTap: (index) {
          controller.pageController.jumpToPage(index);
        },
      ),
    );
  }
}
