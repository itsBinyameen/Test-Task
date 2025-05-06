import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/core/theme/text_theme.dart';
import 'package:test_task/modules/dashboard/account/account_screen.dart';
import 'package:test_task/modules/dashboard/bottom_navigation_screen.dart';
import 'package:test_task/modules/dashboard/categories/categories_screen.dart';
import 'package:test_task/modules/dashboard/dashboard_controller.dart';
import 'package:test_task/modules/dashboard/favourite/favourite_screen.dart';
import 'package:test_task/modules/dashboard/products/products_screen.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            controller.appBarTitles[controller.currentPage.value],
            style: TextStyles.h1,
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationScreen(),
      body: PageView(
        controller: controller.pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (val) {
          controller.changePage(val);
        },
        children: [
          ProductsScreen(),
          CategoriesScreen(),
          FavouriteScreen(),
          AccountScreen(),
        ],
      ),
    );
  }
}
