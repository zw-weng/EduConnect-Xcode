import 'package:educonnect/screens/base_screen.dart';
import 'package:educonnect/screens/fill_profile_screen.dart';
import 'package:educonnect/screens/login_screen.dart';
import 'package:educonnect/screens/onboarding_screen.dart';
import 'package:educonnect/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure bindings are initialized
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EduConnect',
      theme: ThemeData(
        // Using ColorScheme to define primary and secondary colors
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.amber, // Secondary color (accent)
        ),
        scaffoldBackgroundColor: const Color(
            0xFFF5F7FA), // Light background color for the entire app
        fontFamily: 'Poppins', // Custom font if needed
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Button color across the app
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ), // Text style for buttons
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
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF5F7FA), // Light background for AppBar
          elevation: 0, // No shadow
          iconTheme: IconThemeData(color: Color(0xFF1F2C37)), // Icon color
          titleTextStyle: TextStyle(
            color: Color(0xFF1F2C37),
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
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