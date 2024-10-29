import 'package:flutter/material.dart';
import 'package:educonnect/widgets/profile_text_field.dart';
import 'package:educonnect/widgets/gender_dropdown.dart';
import 'package:educonnect/constants/colors.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController =
      TextEditingController(text: "Alex");
  final TextEditingController _nickNameController =
      TextEditingController(text: "Lex");
  final TextEditingController _dobController =
      TextEditingController(text: "1990-01-01");
  final TextEditingController _emailController =
      TextEditingController(text: "test@gmail.com");
  final TextEditingController _phoneNumberController =
      TextEditingController(text: "+91 987-848-1225");

  String? _selectedGender = 'Male';
  final List<String> _genderOptions = ['Male', 'Female', 'Other'];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(1990, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _dobController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Changes saved successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackColor,
      appBar: AppBar(
        backgroundColor: kBackColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kTextColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Edit Profile',
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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                ProfileTextField(
                  controller: _fullNameController,
                  hint: 'Full Name',
                ),
                const SizedBox(height: 16.0),
                ProfileTextField(
                  controller: _nickNameController,
                  hint: 'Nick Name',
                ),
                const SizedBox(height: 16.0),
                ProfileTextField(
                  controller: _dobController,
                  hint: 'Date of Birth',
                  icon: Icons.calendar_today,
                  onTap: () => _selectDate(context),
                ),
                const SizedBox(height: 16.0),
                ProfileTextField(
                  controller: _emailController,
                  hint: 'Email',
                  icon: Icons.email,
                ),
                const SizedBox(height: 16.0),
                ProfileTextField(
                  controller: _phoneNumberController,
                  hint: 'Phone Number',
                  icon: Icons.phone,
                ),
                const SizedBox(height: 16.0),
                GenderDropdown(
                  selectedGender: _selectedGender,
                  genderOptions: _genderOptions,
                  onChanged: (String? newGender) {
                    setState(() {
                      _selectedGender = newGender;
                    });
                  },
                ),
                const SizedBox(height: 30.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _saveChanges,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Save changes',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
