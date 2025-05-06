import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controller for managing the bottom navigation and page view in the dashboard.
class DashboardController extends GetxController {
  // Current selected index for the PageView or BottomNavigationBar
  final RxInt currentPage = 0.obs;

  // Controller to control page navigation programmatically
  final PageController pageController = PageController(initialPage: 0);

  // List of app bar titles for each page
  final List<String> appBarTitles = [
    'Products',
    'Categories',
    'Favourities',
    'Mitt konto',
  ];

  /// Updates the current page index
  void changePage(int val) {
    currentPage.value = val;
    pageController.jumpToPage(val);
  }
}
