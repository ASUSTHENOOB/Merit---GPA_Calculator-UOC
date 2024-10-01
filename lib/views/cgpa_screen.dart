import 'package:cgpa_calc/components/Inputfields.dart';
import 'package:cgpa_calc/components/calcbuttons.dart';
import 'package:cgpa_calc/controllers/animatedbutton_controller.dart';
import 'package:cgpa_calc/controllers/cgpa_controller.dart';
import 'package:cgpa_calc/views/aboutus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Import the fluttertoast package

class CgpaScreen extends StatelessWidget {
  final CGPAController controller = Get.find<CGPAController>();
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
        backgroundColor: const Color(0xFFFFF0F5), // Your background color
        resizeToAvoidBottomInset: false, // This will help remove extra space
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
            'C G P A   C a l c u l a t o r'.toUpperCase(),
            style: const TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Lottie.asset(
              'images/Cgpa.json', // Provide your Lottie animation path here
              height: 180, // Adjust the height as per your requirement
              width: 180, // Adjust the width as per your requirement
              fit: BoxFit.cover,
              repeat: true, // Stop the animation from repeating
              animate: true, // Play the animation automatically
            ),
            // Scrollable content area
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      // TextFields for GPA and Credit Hours input
                      MyTextField1(
                        hintName: "Enter GPA of the Semester",
                        keyboardtype: TextInputType.number,
                        controller: controller.gpaController,
                        obsecuretext: false,
                      ),
                      const SizedBox(height: 10),
                      MyTextField1(
                        hintName: "Enter total credit hours of that Semester",
                        keyboardtype: TextInputType.number,
                        controller: controller.creditController,
                        obsecuretext: false,
                      ),
                      const SizedBox(height: 20),

                      // Add Semester Button
                      MyButton1(
                        text: "Add Semester",
                        ontap: () {
                          if (controller.gpaController.text.isEmpty ||
                              controller.creditController.text.isEmpty) {
                            showToast("Please enter GPA and Credit Hours.");
                          } else {
                            controller.addSemester();
                            showToast(
                                "Semester added successfully ! \n Scroll to see more!");
                          }
                        },
                        icon: Icons.add,
                      ),
                      const SizedBox(height: 20),

                      // Clear All Button
                      Obx(() {
                        return MyButton1(
                          text: "Clear All Semesters",
                          ontap: controller.semesters.isNotEmpty
                              ? () {
                                  Get.dialog(
                                    AlertDialog(
                                      title: const Text(
                                        'Clear All Data',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF004D40),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      content: const Text(
                                        'Are you sure you want to clear all semester data?',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF004D40),
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Get.back(); // Close the dialog
                                          },
                                          child: const Text(
                                            'Cancel',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFF004D40),
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            controller.clearAllSemesters();
                                            Get.back();
                                            showToast("All semesters cleared.");
                                          },
                                          child: const Text(
                                            'Clear',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFF004D40),
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              : null, // Disable button when no data
                          icon: Icons.delete,
                        );
                      }),
                      const SizedBox(height: 20),
                      const Divider(thickness: 1),
                      Obx(() {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.semesters.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(186, 38, 166, 153),
                                    offset: Offset(0.0, 8.0),
                                    blurRadius: 6.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(12),
                                color: const Color.fromARGB(186, 38, 166, 153),
                              ),
                              child: ListTile(
                                title: Text(
                                  'Semester ${index + 1} ,GPA: ${controller.semesters[index]['gpa']}, Total Credit Hours: ${controller.semesters[index]['creditHours']}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),

            // CGPA Display Section at the bottom
            Obx(() {
              return Container(
                height: 80,
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF004D40), // Green background
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Cumulative CGPA: ${controller.cgpa.value.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
