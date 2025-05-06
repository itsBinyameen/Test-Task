import 'package:get/get.dart';
import 'package:test_task/modules/dashboard/categories/categories_controller.dart';
import 'package:test_task/modules/dashboard/dashboard_controller.dart';
import 'package:test_task/modules/dashboard/favourite/favourite_controller.dart';
import 'package:test_task/modules/dashboard/products/products_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => ProductsController());
    Get.lazyPut(() => CategoriesController());
    Get.put(FavouriteController());
  }
}
