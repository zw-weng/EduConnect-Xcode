import 'package:educonnect/screens/base_screen.dart';
import 'package:educonnect/screens/fill_profile_screen.dart';
import 'package:educonnect/screens/login_screen.dart';
import 'package:educonnect/screens/onboarding_screen.dart';
import 'package:educonnect/screens/register_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      theme: ThemeData(
        // Using colorScheme to define primary and secondary colors
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.amber, // Secondary color (accent)
        ),
        scaffoldBackgroundColor:
            const Color(0xFFF5F7FA), // Light background color for the entire app
        fontFamily: 'Poppins', // Custom font if needed
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Button color across the app
            textStyle: const TextStyle(
                fontWeight: FontWeight.bold), // Text style for buttons
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      initialRoute: '/onboarding', // Set the initial route to onboarding screen
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/fillProfile': (context) => const FillProfileScreen(),
        '/home': (context) => const BaseScreen(),
      },
    );
  }
}
