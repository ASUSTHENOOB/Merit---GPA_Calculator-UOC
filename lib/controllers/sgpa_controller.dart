import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SGPAController extends GetxController {
  // Initialize formKey properly as an instance variable
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final subjectNameController = TextEditingController();
  final marksController = TextEditingController();
  final creditHoursController = TextEditingController();

  var subjects = <Map<String, dynamic>>[].obs;
  var finalSgpa = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSavedSubjects();
  }

  double _marksToGradePoints(double marks) {
    if (marks >= 85) return 4.00;
    if (marks >= 80) return 3.66;
    if (marks >= 75) return 3.33;
    if (marks >= 71) return 3.00;
    if (marks >= 68) return 2.66;
    if (marks >= 64) return 2.33;
    if (marks >= 61) return 2.00;
    if (marks >= 58) return 1.66;
    if (marks >= 54) return 1.30;
    if (marks >= 50) return 1.00;
    return 0.00;
  }

  void calculateFinalSGPA() {
    if (subjects.isEmpty) return;

    double totalGradePoints = 0;
    double totalCreditHours = 0;

    for (var subject in subjects) {
      double gradePoints = subject['gradePoints']!;
      double creditHours = subject['creditHours']!;

      totalGradePoints += gradePoints * creditHours;
      totalCreditHours += creditHours;
    }

    finalSgpa.value = totalGradePoints / totalCreditHours;
  }

  void addSubject() {
    if (formKey.currentState!.validate()) {
      // This is safe because formKey is always initialized
      String subjectName = subjectNameController.text;
      double marks = double.parse(marksController.text);
      double creditHours = double.parse(creditHoursController.text);

      double gradePoints = _marksToGradePoints(marks);

      subjects.add({
        'subjectName': subjectName,
        'gradePoints': gradePoints,
        'creditHours': creditHours,
      });

      _saveSubjects();
      subjectNameController.clear();
      marksController.clear();
      creditHoursController.clear();
    }
  }

  void removeSubject(int index) async {
    subjects.removeAt(index);
    if (subjects.isEmpty) {
      finalSgpa.value = 0.0;
    }
    _saveSubjects(); // Save the updated subjects list
  }

  void clearAllSubjects() async {
    subjects.clear();
    finalSgpa.value = 0.0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('subjects');
  }

  Future<void> _saveSubjects() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String subjectsJson = jsonEncode(subjects);
    await prefs.setString('subjects', subjectsJson);
  }

  Future<void> _loadSavedSubjects() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? subjectsJson = prefs.getString('subjects');

    if (subjectsJson != null) {
      subjects.value = List<Map<String, dynamic>>.from(jsonDecode(subjectsJson)
          .map((item) => Map<String, dynamic>.from(item)));
    }
  }

  @override
  void dispose() {
    subjectNameController.dispose();
    marksController.dispose();
    creditHoursController.dispose();
    super.dispose();
  }
}
