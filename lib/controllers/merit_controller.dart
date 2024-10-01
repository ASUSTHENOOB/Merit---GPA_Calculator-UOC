import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MeritController extends GetxController {
  // Controllers for text input
  final matricMarksController = TextEditingController();
  final matricTotalMarksController = TextEditingController();
  final fscMarksController = TextEditingController();
  final fscTotalMarksController = TextEditingController();

  // Observable value for the merit aggregate
  var aggregate = 0.0.obs;

  // Function to calculate merit based on 25% Matric and 75% FSc marks
  void calculateMerit() {
    double matricMarks = double.parse(matricMarksController.text);
    double matricTotalMarks = double.parse(matricTotalMarksController.text);
    double fscMarks = double.parse(fscMarksController.text);
    double fscTotalMarks = double.parse(fscTotalMarksController.text);

    double matricPercentage = (matricMarks / matricTotalMarks) * 100;
    double fscPercentage = (fscMarks / fscTotalMarks) * 100;

    // Merit calculation formula: 25% Matric + 75% FSc
    aggregate.value = (matricPercentage * 0.25) + (fscPercentage * 0.75);
  }

  @override
  void onClose() {
    // Dispose controllers when the controller is removed
    matricMarksController.dispose();
    matricTotalMarksController.dispose();
    fscMarksController.dispose();
    fscTotalMarksController.dispose();
    super.onClose();
  }
}
