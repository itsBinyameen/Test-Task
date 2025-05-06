
import 'package:get/get.dart';
import 'package:test_task/modules/splash/splash_controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SplashController());
  }

}