import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CGPAController extends GetxController {
  final gpaController = TextEditingController();
  final creditController = TextEditingController();

  var semesters = <Map<String, dynamic>>[].obs;
  var cgpa = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSavedSemesters(); // Load saved semesters from shared preferences when the app starts
  }

  void addSemester() {
    double gpa = double.parse(gpaController.text);
    double creditHours = double.parse(creditController.text);

    // Update the list reactively
    semesters.add({'gpa': gpa, 'creditHours': creditHours});

    // Notify that the list has changed (force reactivity)
    semesters.refresh();

    // Clear text fields after adding semester
    gpaController.clear();
    creditController.clear();

    // Save the updated semesters list
    _saveSemesters();

    // Recalculate CGPA
    _calculateCGPA();
  }

  void _calculateCGPA() {
    double totalGradePoints = 0.0;
    double totalCreditHours = 0.0;

    for (var semester in semesters) {
      totalGradePoints += semester['gpa'] * semester['creditHours'];
      totalCreditHours += semester['creditHours'];
    }

    cgpa.value = totalGradePoints / totalCreditHours;
  }

  // Save semesters data to shared preferences
  Future<void> _saveSemesters() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String semestersJson = jsonEncode(semesters);
    await prefs.setString('semesters', semestersJson);
  }

  // Load saved semesters from shared preferences
  Future<void> _loadSavedSemesters() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? semestersJson = prefs.getString('semesters');

    if (semestersJson != null) {
      semesters.value = List<Map<String, dynamic>>.from(
        jsonDecode(semestersJson)
            .map((item) => Map<String, dynamic>.from(item)),
      );
      _calculateCGPA(); // Recalculate CGPA after loading semesters
    }
  }

  // Clear all saved semesters from shared preferences
  // Clear all saved semesters from shared preferences
  Future<void> clearAllSemesters() async {
    // Clear the list
    semesters.clear();

    // Force reactivity to make sure UI rebuilds
    semesters.refresh();

    // Reset CGPA
    cgpa.value = 0.0;

    // Clear from shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('semesters');
  }

  @override
  void dispose() {
    gpaController.dispose();
    creditController.dispose();
    super.dispose();
  }
}
