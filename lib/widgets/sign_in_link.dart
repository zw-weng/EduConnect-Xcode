import 'package:flutter/material.dart';

class SignInLink extends StatelessWidget {
  const SignInLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an Account? '),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/login');
          },
          child: const Text(
            'SIGN IN',
            style: TextStyle(
              color: Color(0xFF1E4FF1),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
