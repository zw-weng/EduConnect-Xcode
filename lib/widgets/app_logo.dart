import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png', // Make sure the logo.png exists in this path
          height: 80,
        ),
        const SizedBox(height: 10),
        const Text(
          'Welcome to EduConnect !',
          style: TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2C37),
          ),
        ),
      ],
    );
  }
}
