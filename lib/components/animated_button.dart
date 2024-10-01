// lib/widgets/animated_button.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? ontap;
  final RxBool isPressed; // Accepting the specific button's observable state

  const AnimatedButton({
    super.key,
    required this.text,
    required this.ontap,
    required this.icon,
    required this.isPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          if (ontap != null) {
            ontap!();
          }
        },
        child: Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            height: isPressed.value ? 50 : 60,
            width: isPressed.value
                ? 150
                : 250, // Use the specific button's observable
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Color(0xFF26A69A),
                    offset: Offset(0.0, 0.0),
                    blurRadius: 12.0,
                    spreadRadius: 3),
              ],
              color: const Color(0xFF26A69A),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(width: 8),
                Icon(
                  isPressed.value ? Icons.check_circle : icon,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
