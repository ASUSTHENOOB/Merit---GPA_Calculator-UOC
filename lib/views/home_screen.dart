import 'package:cgpa_calc/components/animated_button.dart';
import 'package:cgpa_calc/controllers/animatedbutton_controller.dart';
import 'package:cgpa_calc/views/aboutus.dart';
import 'package:cgpa_calc/views/cgpa_screen.dart';
import 'package:cgpa_calc/views/merit_screen.dart';
import 'package:cgpa_calc/views/sgpa_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cgpa_calc/controllers/home_controller.dart'; // Import the HomeController

class HomeScreen extends StatelessWidget {
  final HomeController controller =
      Get.put(HomeController()); // Initialize the HomeController
  final ButtonController buttonController = Get.put(ButtonController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => AboutUsScreen());
                },
                icon: Icon(Icons.info))
          ],
          backgroundColor: Color(0xFF004D40),
          centerTitle: true,
          title: Text(
            'C a l c u l a t o r s'.toUpperCase(),
            style: TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              const Text(
                'Welcome to the UOC CALCS!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFF004D40)),
              ),
              const SizedBox(height: 20),
              // Display the user's name below the main welcome text
              Divider(
                thickness: 0.6,
              ),
              Column(
                children: [
                  Icon(
                    Icons.person,
                    color: Color(0xFF26A69A),
                    size: 100,
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                        Color(0xFF004D40),
                        Color(0xFF26A69A),
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.topCenter,
                    ).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                    child: Obx(() => Text(
                          'H O L A ! ${controller.userName.value}!', // Display user's name here
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Color(0xFF26A69A)),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "CHOOSE AN OPTION BELOW !",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF004D40)),
              ),
              const SizedBox(height: 40),
              AnimatedButton(
                  text: "CGPA CALC",
                  ontap: () {
                    buttonController.toggleCgpaButton();
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      Get.to(
                        () => CgpaScreen(),
                        transition: Transition.fadeIn,
                      );
                    });
                  },
                  icon: Icons.calculate,
                  isPressed: buttonController.isCgpabuttonPressed),
              SizedBox(
                height: 15,
              ),
              AnimatedButton(
                  text: "SGPA CALC",
                  ontap: () {
                    buttonController.toggleSgpaButton();
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      Get.to(
                        () => SGPAHomePage(),
                        transition: Transition.fadeIn,
                      ); // Navigate to Login Page
                    });
                  },
                  icon: Icons.school,
                  isPressed: buttonController.isSgpabuttonPressed),
              SizedBox(
                height: 15,
              ),

              AnimatedButton(
                  text: "Merit CALC",
                  ontap: () {
                    buttonController.toggleMeritButton();
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      Get.to(
                        () => MeritCalculatorScreen(),
                        transition: Transition.fadeIn,
                      ); // Navigate to Login Page
                    });
                  },
                  icon: Icons.military_tech,
                  isPressed: buttonController.isMeritbuttonPressed)
            ],
          ),
        ),
      ),
    );
  }
}
