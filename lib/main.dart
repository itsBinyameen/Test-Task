import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:test_task/modules/splash/splash_binding.dart';

import 'core/theme/app_theme.dart';
import 'routes/pages.dart';
import 'routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Test Task',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialBinding: SplashBinding(),
      initialRoute: Routes.initial,
      getPages: Pages.pages,
    );
  }
}

