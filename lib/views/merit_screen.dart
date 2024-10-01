// ignore_for_file: use_key_in_widget_constructors

import 'package:cgpa_calc/components/Inputfields.dart';
import 'package:cgpa_calc/components/calcbuttons.dart';
import 'package:cgpa_calc/components/static_button.dart';
import 'package:cgpa_calc/controllers/animatedbutton_controller.dart';
import 'package:cgpa_calc/controllers/merit_controller.dart';
import 'package:cgpa_calc/views/aboutus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:lottie/lottie.dart';
// Import MeritController

class MeritCalculatorScreen extends StatelessWidget {
  final MeritController controller =
      Get.put(MeritController()); // Initialize the controller
  final ButtonController buttonController = Get.put(ButtonController());
  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Color(0xFF26A69A),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        buttonController.resetButtons();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => AboutUsScreen());
                },
                icon: Icon(Icons.info))
          ],
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color(0xFF004D40),
          centerTitle: true,
          title: Text(
            'M E R I T   C a l c u l a t o r'.toUpperCase(),
            style: const TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Lottie.asset(
                  'images/Merit.json', // Provide your Lottie animation path here
                  height: 180, // Adjust the height as per your requirement
                  width: 180, // Adjust the width as per your requirement
                  fit: BoxFit.cover,
                  repeat: false, // Stop the animation from repeating
                  animate: true, // Play the animation automatically
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "UNDERGRADUATE MERIT CALC !",
                  style: TextStyle(
                      color: Color(0xFF004D40),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextField1(
                  hintName: "Marks obtained in Matric / ECAT / LAT",
                  controller: controller.matricMarksController,
                  keyboardtype: TextInputType.number,
                  obsecuretext: false,
                ),

                const SizedBox(height: 10),
                MyTextField1(
                  hintName: "Total Marks in Matric / ECAT / LAT",
                  controller: controller.matricTotalMarksController,
                  keyboardtype: TextInputType.number,
                  obsecuretext: false,
                ),
                const SizedBox(height: 10),
                MyTextField1(
                  hintName: "Marks obtained in FSc or Equivalent",
                  controller: controller.fscMarksController,
                  keyboardtype: TextInputType.number,
                  obsecuretext: false,
                ),
                const SizedBox(height: 10),
                MyTextField1(
                  hintName: "Total Marks in FSc or Equivalent",
                  controller: controller.fscTotalMarksController,
                  keyboardtype: TextInputType.number,
                  obsecuretext: false,
                ),
                const SizedBox(height: 20),
                MyButton1(
                    text: "Calculate Merit",
                    ontap: () {
                      if (controller.matricMarksController.text.isEmpty ||
                          controller.matricTotalMarksController.text.isEmpty ||
                          controller.fscMarksController.text.isEmpty ||
                          controller.fscTotalMarksController.text.isEmpty) {
                        showToast("Please Enter the credentials !");
                      } else {
                        controller.calculateMerit();
                        showToast("Successfully Generated Aggregate !");
                      }
                    },
                    icon: Icons.military_tech),
                const SizedBox(height: 24),
                // Display aggregate using Obx to reactively update UI
                Obx(() {
                  return Text(
                    'Your Aggregate Is: ${controller.aggregate.value.toStringAsFixed(2)}%',
                    style: const TextStyle(
                      color: const Color(0xFF004D40),
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
