import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData? icon;
  final VoidCallback? onTap;

  const ProfileTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: onTap != null,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFE7ECF3),
        hintText: hint,
        prefixIcon:
            icon != null ? Icon(icon, color: const Color(0xFF6A6A6A)) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
      ),
      onTap: onTap,
      validator: (value) => value!.isEmpty ? 'Please enter your $hint' : null,
    );
  }
}
