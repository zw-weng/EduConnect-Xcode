// ProfileScreen.dart
import 'package:flutter/material.dart';
import 'package:educonnect/widgets/profile_card.dart';
import 'edit_profile_screen.dart';
import 'package:educonnect/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Logout function
  void _logout(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login'); // Adjust route as needed
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logged out successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackColor,
      appBar: AppBar(
        backgroundColor: kBackColor,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: kTextColor,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ProfileCard(
                fullName: "Alex",
                email: "test@gmail.com",
                onEdit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProfileScreen()),
                  );
                },
                onLogout: () => _logout(context),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
