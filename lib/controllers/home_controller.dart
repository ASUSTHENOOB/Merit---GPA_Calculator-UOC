import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var userName = ''.obs; // Observable to store the user's name

  @override
  void onInit() {
    super.onInit();
    loadUserName(); // Load the user's name when the controller is initialized
  }

  Future<void> loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName.value = prefs.getString('userName') ??
        'Guest'; // Fetch the saved name or default to 'Guest'
  }
}
