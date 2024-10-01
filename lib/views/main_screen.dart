import 'package:cgpa_calc/views/merit_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Import the merit calculator screen
import 'cgpa_screen.dart'; // Assuming CGPA calculator screen is already implemented

// ignore: use_key_in_widget_constructors
class MainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(() =>
                    MeritCalculatorScreen()); // Navigate to Merit Calculator
              },
              child: const Text('Merit Calculator'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() =>
                    CgpaScreen()); // Navigate to GPA Calculator (CGPA/SGPA)
              },
              child: const Text('GPA Calculator'),
            ),
          ],
        ),
      ),
    );
  }
}
