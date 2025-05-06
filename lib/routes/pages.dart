import 'package:get/get.dart';
import 'package:test_task/modules/dashboard/dashboard_binding.dart';
import 'package:test_task/modules/dashboard/dashboard_screen.dart';
import 'package:test_task/modules/splash/splash_screen.dart';
import 'package:test_task/routes/routes.dart';

abstract class Pages {
  static final pages = [
    GetPage(name: Routes.initial, page: () => const SplashScreen()),
    GetPage(name: Routes.dashboardScreen, page: () => const DashboardScreen(),binding: DashboardBinding()),
  ];
}
