import 'package:flutter/material.dart';

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
            color: Colors.black.withOpacity(0.1),
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
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, size: 40, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Text(
            fullName,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2C37),
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
            leading: const Icon(Icons.edit, color: Color(0xFF1F2C37)),
            title: const Text('Edit Profile'),
            trailing:
                const Icon(Icons.arrow_forward_ios, color: Color(0xFF1F2C37)),
            onTap: onEdit,
          ),
        ],
      ),
    );
  }
}
