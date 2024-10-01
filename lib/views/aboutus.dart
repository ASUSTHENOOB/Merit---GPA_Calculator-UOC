import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF004D40),
        centerTitle: true,
        title: Text(
          'A B O U T   D E V S  </>'.toUpperCase(),
          style: const TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Meet the Developers',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF004D40)),
            ),
            const SizedBox(height: 20),
            // Combined Photo as Oval Avatar
            Center(
              child: ClipOval(
                child: Image.asset(
                  'images/coombine.jpg', // Add your combined photo here
                  width: 200, // Adjust width as necessary
                  height: 200, // Adjust height as necessary
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Description
            Container(
              padding: EdgeInsets.all(16),
              height: 370,
              width: 390,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFF004D40),
                    offset: Offset(0.0, 0.0),
                    spreadRadius: 6,
                    blurRadius: 6.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFF004D40),
              ),
              child: const Text(
                'We are TALHA HASSAN and UMAIR JAHANGIR recently graduated from University Of Chakwal, passionate Flutter developers committed to creating user-friendly applications. With a focus on clean code and effective state management, we have developed sub-apps for the University of Chakwal, including the UOC E-Library. Our skills extend beyond Flutter to core PHP and third-party AI integration, allowing us to deliver efficient and innovative solutions for our users. Together, we strive to enhance the educational experience and empower students with technology.',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontSize: 16,
                  letterSpacing: 0.5,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
