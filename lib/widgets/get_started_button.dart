import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GetStartedButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Increased border radius for rounder corners
        ),
        backgroundColor: const Color(0xFF1E4FF1),
        padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 16.0), // Increased padding for bigger size
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Get Started',
            style: TextStyle(
                fontSize: 20.0, // Increased font size
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          SizedBox(width: 10),
          Icon(Icons.arrow_forward, color: Colors.white, size: 24.0), // Increased icon size
        ],
      ),
    );
  }
}