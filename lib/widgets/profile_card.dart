import 'package:flutter/material.dart';
import 'package:educonnect/constants/colors.dart';

class ProfileCard extends StatelessWidget {
  final String fullName;
  final String email;
  final VoidCallback onEdit;

  const ProfileCard({
    super.key,
    required this.fullName,
    required this.email,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: kPrimaryLight,
            child: const Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 16.0),
          Text(
            fullName,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: kTextColor,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            email,
            style: const TextStyle(
              fontSize: 14.0,
              color: Color(0xFF6A6A6A),
            ),
          ),
          const SizedBox(height: 20.0),
          Divider(color: Colors.grey[300]),
          ListTile(
            leading: const Icon(Icons.edit, color: kTextColor),
            title: const Text(
              "Edit Profile",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: kTextColor,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: onEdit,
          ),
        ],
      ),
    );
  }
}
