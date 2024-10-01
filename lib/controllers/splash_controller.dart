import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNext();
  }

  Future<void> _navigateToNext() async {
    await Future.delayed(
        Duration(milliseconds: 1500)); // Show splash for 3 seconds
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool hasEnteredName = prefs.getBool('hasEnteredName') ?? false;

    if (hasEnteredName) {
      // If the name has already been entered, go to home screen
      Get.offNamed('/home');
    } else {
      // Otherwise, show the onboarding screen
      Get.offNamed('/onboarding');
    }
  }
}

// Splash Binding (Used to bind controller to the SplashScreen)
class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
