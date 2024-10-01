import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NameEntryController extends GetxController {
  final nameController = TextEditingController();

  Future<void> saveNameAndProceed() async {
    String name = nameController.text;

    if (name.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userName', name); // Store the name
      await prefs.setBool('hasEnteredName', true); // Set flag to true

      // Navigate to home screen
      Get.offNamed('/home');
    } else {
      Get.snackbar(
          'Error', 'Please enter your name'); // Show error if name is empty
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
