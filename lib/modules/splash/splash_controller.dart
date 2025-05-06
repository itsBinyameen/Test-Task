
import 'package:get/get.dart';
import 'package:test_task/routes/routes.dart';

class SplashController extends GetxController{

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await navigateToNextScreen();
  }

  Future<void> navigateToNextScreen()async{
    Future.delayed(const Duration(seconds: 3),() async{
        Get.offNamed(Routes.dashboardScreen);
    });

  }
}