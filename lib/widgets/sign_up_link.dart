import 'package:flutter/material.dart';

class SignUpLink extends StatelessWidget {
  const SignUpLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have an Account? '),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/register');
          },
          child: const Text(
            'SIGN UP',
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
