import 'package:flutter/material.dart';
import 'package:educonnect/widgets/app_logo.dart';
import 'package:educonnect/widgets/login_form.dart';
import 'package:educonnect/widgets/sign_up_link.dart';
import 'package:educonnect/models/initial_user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  void _login() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;

      // Validate the credentials
      if (email == InitialUser.email && password == InitialUser.password) {
        // Successful login
        print('Login successful!');
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Failed login
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid email or password'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // Light background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // App Logo
                const AppLogo(),
                const SizedBox(height: 30),

                // Login Form
                LoginForm(
                  formKey: _formKey,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  isPasswordVisible: _isPasswordVisible,
                  rememberMe: _rememberMe,
                  onPasswordToggle: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  onRememberMeToggle: (value) {
                    setState(() {
                      _rememberMe = value ?? false;
                    });
                  },
                  onLogin: _login,
                ),
                const SizedBox(height: 20),

                // Sign Up link
                const SignUpLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
