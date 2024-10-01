// ignore_for_file: constant_identifier_names

import 'package:cgpa_calc/controllers/splash_controller.dart';
import 'package:cgpa_calc/views/cgpa_screen.dart';
import 'package:cgpa_calc/views/home_screen.dart';
import 'package:cgpa_calc/views/merit_screen.dart';
import 'package:cgpa_calc/views/nameentry_screen.dart';
import 'package:cgpa_calc/views/onboarding_screen.dart';
import 'package:cgpa_calc/views/sgpa_screen.dart';
import 'package:cgpa_calc/views/splash_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const SPLASH = '/';
  static const HOME = '/home';
  static const ONBOARDING = '/onboarding';
  static const NAMEENTRY = '/nameentry';
  static const SGPA = '/sgpa';
  static const CGPA = '/cgpa';
  static const MERIT = '/merit'; // Add Merit route
}

class AppRoutes {
  static final routes = [
    GetPage(
        name: Routes.SPLASH,
        page: () => SplashScreen(),
        binding: SplashBinding()),
    GetPage(name: Routes.ONBOARDING, page: () => const OnboardingScreen()),
    GetPage(name: Routes.NAMEENTRY, page: () => NameEntryScreen()),
    GetPage(name: Routes.HOME, page: () => HomeScreen()),
    GetPage(name: Routes.SGPA, page: () => SGPAHomePage()),
    GetPage(name: Routes.CGPA, page: () => CgpaScreen()),
    GetPage(
        name: Routes.MERIT,
        page: () => MeritCalculatorScreen()), // Register Merit Calculator
  ];
}
