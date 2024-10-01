import 'package:get/get.dart';

class ButtonController extends GetxController {
  // Separate observable variables for each button state
  var isCgpabuttonPressed = false.obs;
  var isSgpabuttonPressed = false.obs;
  var isMeritbuttonPressed = false.obs;

  // Function to toggle login button state
  void toggleCgpaButton() {
    isCgpabuttonPressed.value = !isCgpabuttonPressed.value;
  }

  // Function to toggle signup button state
  void toggleSgpaButton() {
    isSgpabuttonPressed.value = !isSgpabuttonPressed.value;
  }

  void toggleMeritButton() {
    isMeritbuttonPressed.value = !isMeritbuttonPressed.value;
  }

  Future resetButtons() async {
    await Future.delayed(const Duration(milliseconds: 10));
    isCgpabuttonPressed.value = false;
    isSgpabuttonPressed.value = false;
    isMeritbuttonPressed.value = false;
  }
}
