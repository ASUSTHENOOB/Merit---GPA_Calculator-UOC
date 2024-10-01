import 'package:flutter/material.dart';

class MyButton1 extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? ontap; // Use Future<void> here for async function

  const MyButton1({
    super.key,
    required this.text,
    required this.ontap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: ontap != null
            ? () {
                ontap!(); // Handle the Future function inside an anonymous function
              }
            : null,
        child: Container(
          height: 50,
          width: 200,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(180, 38, 166, 153),
                  offset: Offset(0.0, 0.0),
                  blurRadius: 6.0,
                  spreadRadius: 6),
            ],
            color: Color(0xFF26A69A),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 17, // Font size
                  fontWeight: FontWeight.bold, // Font weight
                ),
              ),
              const SizedBox(width: 8), // Space between text and icon
              Icon(
                icon,
                color: Colors.white, // Ensure icon color matches your design
              ),
            ],
          ),
        ),
      ),
    );
  }
}
