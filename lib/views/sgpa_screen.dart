import 'package:cgpa_calc/components/Inputfields.dart';
import 'package:cgpa_calc/components/calcbuttons.dart';
import 'package:cgpa_calc/controllers/animatedbutton_controller.dart';
import 'package:cgpa_calc/controllers/sgpa_controller.dart';
import 'package:cgpa_calc/views/aboutus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SGPAHomePage extends StatelessWidget {
  final SGPAController controller = Get.find<SGPAController>();
  final ButtonController buttonController = Get.put(ButtonController());

  final ScrollController _scrollController =
      ScrollController(); // ScrollController for SingleChildScrollView

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: const Color(0xFF004D40),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  // Function to scroll to the end
  void scrollToEnd() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // Changed PopScope to WillPopScope
      onPopInvokedWithResult: (didPop, result) {
        buttonController.resetButtons();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
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
            'S G P A   C a l c u l a t o r'.toUpperCase(),
            style: const TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Lottie.asset(
                  'images/Cgpa.json', // Provide your Lottie animation path here
                  height: 180,
                  width: 180,
                  fit: BoxFit.cover,
                  repeat: true,
                  animate: true,
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: SingleChildScrollView(
                    controller:
                        _scrollController, // Attach scroll controller here
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyTextField1(
                            controller: controller.subjectNameController,
                            hintName: "Enter Subject Name",
                            keyboardtype: TextInputType.text,
                            obsecuretext: false,
                          ),
                          const SizedBox(height: 12.0),
                          MyTextField1(
                            controller: controller.marksController,
                            hintName: "Enter Marks Out Of 100",
                            keyboardtype: TextInputType.number,
                            obsecuretext: false,
                          ),
                          const SizedBox(height: 12.0),
                          MyTextField1(
                            controller: controller.creditHoursController,
                            hintName: "Enter Credit Hours Of That Subject",
                            keyboardtype: TextInputType.number,
                            obsecuretext: false,
                          ),
                          const SizedBox(height: 12.0),
                          MyButton1(
                            text: "Add Subject",
                            ontap: () {
                              if (controller.subjectNameController.text.isEmpty ||
                                  controller
                                      .creditHoursController.text.isEmpty ||
                                  controller.marksController.text.isEmpty) {
                                showToast("Please Enter the credentials !");
                              } else {
                                controller.addSubject();
                                showToast(
                                    "Subject added successfully ! \n Scroll to see more!");
                                scrollToEnd(); // Scroll to the newly added item
                              }
                            },
                            icon: Icons.add,
                          ),
                          const SizedBox(height: 16),
                          Obx(() {
                            return MyButton1(
                              text: "Clear all Subjects",
                              icon: Icons.clear,
                              ontap: controller.subjects.isNotEmpty
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
                                            'Are you sure you want to clear all subjects?',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFF004D40),
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xFF004D40),
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                controller.clearAllSubjects();
                                                Get.back();
                                              },
                                              child: const Text(
                                                'Clear',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xFF004D40),
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  : null,
                            );
                          }),
                          const SizedBox(height: 20),
                          const Divider(thickness: 1),
                          Obx(() {
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.subjects.length,
                              itemBuilder: (context, index) {
                                final subject = controller.subjects[index];
                                return Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(186, 38, 166, 153),
                                        offset: Offset(0.0, 8.0),
                                        blurRadius: 6.0,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(12),
                                    color:
                                        const Color.fromARGB(186, 38, 166, 153),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      '${subject['subjectName']}:',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle: Text(
                                      " Grade Points ${subject['gradePoints']}, Credit Hours: ${subject['creditHours']}",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                      onPressed: () {
                                        Get.dialog(
                                          AlertDialog(
                                            title: const Text(
                                              'Delete Subject',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFF004D40),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            content: const Text(
                                              'Are you sure you want to delete this subject?',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFF004D40),
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Get.back(); // Close the dialog without deleting
                                                },
                                                child: const Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color(0xFF004D40),
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  controller
                                                      .removeSubject(index);
                                                  Get.back(); // Close the dialog after deleting
                                                },
                                                child: const Text(
                                                  'Delete',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color(0xFF004D40),
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                          const SizedBox(height: 24.0),
                        ],
                      ),
                    ),
                  ),
                ),
                // Container for Calculate Final SGPA Button and Result
                Container(
                  height: 100,
                  padding: const EdgeInsets.all(12.0),
                  decoration: const BoxDecoration(
                    color: Color(0xFF004D40), // Green background
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      MyButton1(
                        text: "Calculate Final SGPA",
                        ontap: controller.calculateFinalSGPA,
                        icon: Icons.calculate_rounded,
                      ),
                      Obx(() {
                        return controller.finalSgpa.value != 0
                            ? Text(
                                'Your Final SGPA is: ${controller.finalSgpa.value.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )
                            : Container();
                      }),
                    ],
                  ),
                ),
              ],
            ),
            // Floating Action Button Positioned in the Middle of the Screen
            Obx(() {
              return controller.subjects.isNotEmpty
                  ? Positioned(
                      bottom: MediaQuery.of(context).size.height / 1 -
                          270, // Vertical center adjustment
                      right: 16, // Offset from the right edge
                      child: FloatingActionButton(
                        onPressed: scrollToEnd, // Scroll to the bottom
                        backgroundColor: const Color(0xFF004D40),
                        child: const Icon(Icons.arrow_downward,
                            color: Colors.white),
                      ),
                    )
                  : Container(); // Do not show FAB if there are no subjects
            }),
          ],
        ),
      ),
    );
  }
}
