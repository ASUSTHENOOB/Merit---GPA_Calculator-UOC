import 'package:cgpa_calc/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  final Color kDarkBlueColor = const Color(0xFF053149);

  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: 'G e t   S t a r t e d ',
      onFinish: () {
        Get.toNamed(Routes.NAMEENTRY);
      },
      finishButtonStyle: const FinishButtonStyle(
        elevation: 15,
        backgroundColor: Color(0xFF26A69A),
      ),
      skipTextButton: const Text(
        'Skip..',
        style: TextStyle(
          fontSize: 16,
          color: Color(0xFF26A69A),
          fontWeight: FontWeight.w600,
        ),
      ),
      controllerColor: const Color(0xFF26A69A),
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      background: [
        Image.asset(
          'images/onboarding1.png',
          height: 400,
        ),
        Image.asset(
          'images/2.png',
          height: 400,
        ),
        Image.asset(
          'images/3.png',
          height: 400,
        ),
      ],
      speed: 2.2,
      pageBodies: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                'Calculate Your Merit',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Easily compute your undergraduate merit for admission in UOC. Stay updated with precise results.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(97, 0, 0, 0),
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                'Track Your Academic Progress Effortlessly',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Calculate your SGPA, CGPA, ease—stay on top of your grades with accurate insights.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(97, 0, 0, 0),
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                'Start now Stay Informed, Stay Ahead',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Analyze your semester results and  performance quickly, improving your academic journey',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(97, 0, 0, 0),
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
