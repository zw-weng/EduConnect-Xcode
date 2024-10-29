import 'package:flutter/material.dart';
import 'package:educonnect/widgets/profile_card.dart';
import 'package:educonnect/widgets/profile_form_page.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  // Initial user data
  final TextEditingController _fullNameController =
      TextEditingController(text: "Alex");
  final TextEditingController _nickNameController =
      TextEditingController(text: "Lex");
  final TextEditingController _dobController =
      TextEditingController(text: "1990-01-01"); // Format as YYYY-MM-DD
  final TextEditingController _emailController =
      TextEditingController(text: "hernandex.redial@gmail.ac.in");
  final TextEditingController _phoneNumberController =
      TextEditingController(text: "+91 987-848-1225");

  String? _selectedGender = 'Male'; // Initial gender selection
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
        _dobController.text =
            "${pickedDate.toLocal()}".split(' ')[0]; // Format as YYYY-MM-DD
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
                ProfileCard(
                  fullName: _fullNameController.text,
                  email: _emailController.text,
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
