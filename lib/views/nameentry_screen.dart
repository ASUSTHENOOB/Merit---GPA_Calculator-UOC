import 'package:cgpa_calc/components/static_button.dart';
import 'package:cgpa_calc/components/textfields.dart';
import 'package:cgpa_calc/controllers/nameentry_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:lottie/lottie.dart'; // Import the Lottie package

// ignore: use_key_in_widget_constructors
class NameEntryScreen extends StatelessWidget {
  final NameEntryController controller = Get.put(NameEntryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF004D40),
          centerTitle: true,
          title: Text(
            'R e g i s t e r    Y o u r s e l f'.toUpperCase(),
            style: TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add Lottie animation at the start
              Lottie.asset(
                'images/Nameentryanimation.json', // Provide your Lottie animation path here
                height: 350, // Adjust the height as per your requirement
                width: 350, // Adjust the width as per your requirement
                fit: BoxFit.cover,
                repeat: true, // Stop the animation from repeating
                animate: true, // Play the animation automatically
              ),
              const SizedBox(
                  height:
                      20), // Add some space between the animation and the input field

              // TextField for Name Entry
              MyTextField(
                  hintName: "Enter Your Name",
                  controller: controller.nameController,
                  obsecuretext: false),
              const SizedBox(height: 40),

              // Submit Button
              MyButton(
                text: 'Submit',
                icon: Icons.arrow_forward,
                ontap: () async {
                  await controller.saveNameAndProceed();
                  Get.offNamed('./home');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
