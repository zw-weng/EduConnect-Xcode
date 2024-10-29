import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(18.0),
        backgroundColor: const Color(0xFF1E4FF1),
      ),
      child: const Icon(Icons.arrow_forward, color: Colors.white),
    );
  }
}
