import 'package:educonnect/constants/colors.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/ic_launcher-web.png', // Make sure the logo.png exists in this path
            height: 120, // Increased height for the app icon
          ),
          const SizedBox(height: 10),
          const Text(
            'Welcome to EduConnect!',
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
              color: kTextColor,
            ),
            textAlign: TextAlign.center, // Ensure the text is centered
          ),
        ],
      ),
    );
  }
}