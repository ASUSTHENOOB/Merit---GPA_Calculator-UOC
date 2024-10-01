import 'package:cgpa_calc/controllers/cgpa_controller.dart';
import 'package:cgpa_calc/controllers/sgpa_controller.dart';
import 'package:cgpa_calc/routes/app_routes.dart';
import 'package:cgpa_calc/views/home_screen.dart';
import 'package:cgpa_calc/views/nameentry_screen.dart';
import 'package:cgpa_calc/views/onboarding_screen.dart';
import 'package:cgpa_calc/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(CgpaCalculator());
}

// ignore: use_key_in_widget_constructors
class CgpaCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Inject the controllers when the app starts
    Get.put(SGPAController());
    Get.put(CGPAController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CGPA, SGPA & Merit Calculator',
      initialRoute: Routes.SPLASH,
      getPages: AppRoutes.routes,
    );
  }
}
