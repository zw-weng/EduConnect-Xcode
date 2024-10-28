import 'package:flutter/material.dart';

class ProfileForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController fullNameController;
  final TextEditingController nickNameController;
  final TextEditingController dobController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final String? selectedGender;
  final List<String> genderOptions;
  final ValueChanged<String?> onGenderChanged;
  final VoidCallback onSelectDate;
  final VoidCallback onSaveChanges;

  const ProfileForm({
    super.key,
    required this.formKey,
    required this.fullNameController,
    required this.nickNameController,
    required this.dobController,
    required this.emailController,
    required this.phoneNumberController,
    required this.selectedGender,
    required this.genderOptions,
    required this.onGenderChanged,
    required this.onSelectDate,
    required this.onSaveChanges,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 20.0),

          // Full Name Field
          TextFormField(
            controller: fullNameController,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFE7ECF3), // Light field color
              hintText: 'Full Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),

          // Nick Name Field
          TextFormField(
            controller: nickNameController,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFE7ECF3),
              hintText: 'Nick Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 16.0),

          // Date of Birth Field
          TextFormField(
            controller: dobController,
            readOnly: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFE7ECF3),
              hintText: 'Date of Birth',
              prefixIcon:
                  const Icon(Icons.calendar_today, color: Color(0xFF6A6A6A)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
            ),
            onTap: onSelectDate,
          ),
          const SizedBox(height: 16.0),

          // Email Field
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFE7ECF3),
              hintText: 'Email',
              prefixIcon: const Icon(Icons.email, color: Color(0xFF6A6A6A)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),

          // Phone Number Field
          TextFormField(
            controller: phoneNumberController,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFE7ECF3),
              hintText: 'Phone Number',
              prefixIcon: const Icon(Icons.phone, color: Color(0xFF6A6A6A)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
            ),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16.0),

          // Gender Dropdown Field
          DropdownButtonFormField<String>(
            value: selectedGender,
            items: genderOptions.map((String gender) {
              return DropdownMenuItem<String>(
                value: gender,
                child: Text(gender),
              );
            }).toList(),
            onChanged: onGenderChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFE7ECF3),
              hintText: 'Gender',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 30.0),

          // Save Changes Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onSaveChanges,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1F2C37), // Dark blue color
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Save changes',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
