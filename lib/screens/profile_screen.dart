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
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.5],
              colors: [
                kPrimaryLight,
                kPrimaryColor,
              ],
            ),
          ),
        ),
        title: Text(
          "My Profile",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
              ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // Wrap the entire content in SingleChildScrollView
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
                const SizedBox(
                    height: 20), // Space between ProfileCard and image
                Image.asset(
                  'assets/images/Main img.png', // Replace with your image path
                  height: 200, // Adjust the height as needed
                  fit: BoxFit.cover, // Adjust the fit as needed
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
