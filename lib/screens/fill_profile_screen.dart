import 'package:flutter/material.dart';
import 'package:educonnect/widgets/app_logo.dart';
import 'package:educonnect/widgets/profile_form.dart';

class FillProfileScreen extends StatefulWidget {
  const FillProfileScreen({Key? key}) : super(key: key);

  @override
  _FillProfileScreenState createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
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

  // Continue function with navigation to home page
  void _continue() {
    if (_formKey.currentState!.validate()) {
      // Here you can handle profile saving logic
      print('Full Name: ${_fullNameController.text}');
      print('Nick Name: ${_nickNameController.text}');
      print('Date of Birth: ${_dobController.text}');
      print('Email: ${_emailController.text}');
      print('Phone Number: ${_phoneNumberController.text}');
      print('Gender: $_selectedGender');

      // Navigate to the home screen after profile completion
      Navigator.pushReplacementNamed(context, '/home');
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
          'Fill Your Profile',
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
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // App Logo
                const AppLogo(),
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
                  onContinue: _continue, // Updated to navigate to home
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
