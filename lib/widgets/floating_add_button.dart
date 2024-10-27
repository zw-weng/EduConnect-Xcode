import 'package:educonnect/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const CustomFAB({super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: kPrimaryLight,
      foregroundColor: Colors.white,
      child: Icon(icon),
    );
  }
}
