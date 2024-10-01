import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cgpa_calc/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                colors: [Color(0xFF004D40), Color(0xFF26A69A)])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              'images/graduation-hat.png',
              height: 200,
              width: 200,
            )),
            const SizedBox(height: 30),
            SizedBox(
              height: 30,
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TyperAnimatedText('Merit and cgpa calc uoc'.toUpperCase(),
                      textStyle: const TextStyle(
                          letterSpacing: 1.1,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          color: Colors.white))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
