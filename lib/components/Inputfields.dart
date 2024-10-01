import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField1 extends StatelessWidget {
  final String hintName;
  final TextInputType keyboardtype;
  final bool obsecuretext;
  TextEditingController controller;

  MyTextField1({
    super.key,
    required this.hintName,
    required this.keyboardtype,
    required this.controller,
    required this.obsecuretext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: [
          // Neon-effect TextField with gradient shadow
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                // Darker shadow for inner part of neon glow
                BoxShadow(
                  color: const Color(0xFF004D40).withOpacity(0.3), // Dark teal
                  blurRadius: 12, // Soft glow
                  spreadRadius: 6, // Glow intensity
                  offset: const Offset(0, 0), // No offset
                ),
                // Lighter shadow for outer glow
                BoxShadow(
                  color:
                      const Color(0xFF26A69A).withOpacity(0.5), // Lighter teal
                  blurRadius: 20, // Larger spread for outer glow
                  spreadRadius: 5, // Further outer intensity
                  offset: const Offset(0, 0), // No offset
                ),
              ],
            ),
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              obscureText: obsecuretext,
              controller: controller,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF26A69A)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xFF26A69A),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                hintText: hintName,
                fillColor: Color.fromARGB(121, 38, 166, 153),
                filled: true,
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
        ],
      ),
    );
  }
}
