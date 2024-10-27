import 'package:flutter/material.dart';
import 'package:demo/widgets/profile_card.dart';
import 'package:demo/widgets/profile_form_page.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  String? _selectedGender;
  final List<String> _genderOptions = ['Male', 'Female', 'Other'];

  // Function to show date picker for Date of Birth
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _dobController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  // Save changes function
  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      // Save form data or send to backend
      print('Full Name: ${_fullNameController.text}');
      print('Nick Name: ${_nickNameController.text}');
      print('Date of Birth: ${_dobController.text}');
      print('Email: ${_emailController.text}');
      print('Phone Number: ${_phoneNumberController.text}');
      print('Gender: $_selectedGender');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Changes saved successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // Light background color
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7FA), // Match background color
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1F2C37)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color(0xFF1F2C37),
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Profile Card
                const ProfileCard(
                  fullName: 'Alex',
                  email: 'hernandex.redial@gmail.ac.in',
                ),

                const SizedBox(height: 20),

                // Profile Form
                ProfileForm(
                  formKey: _formKey,
                  fullNameController: _fullNameController,
                  nickNameController: _nickNameController,
                  dobController: _dobController,
                  emailController: _emailController,
                  phoneNumberController: _phoneNumberController,
                  selectedGender: _selectedGender,
                  genderOptions: _genderOptions,
                  onGenderChanged: (String? newGender) {
                    setState(() {
                      _selectedGender = newGender;
                    });
                  },
                  onSelectDate: () => _selectDate(context),
                  onSaveChanges: _saveChanges,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
