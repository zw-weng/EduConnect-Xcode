import 'package:flutter/material.dart';

class GenderDropdown extends StatelessWidget {
  final String? selectedGender;
  final List<String> genderOptions;
  final ValueChanged<String?> onChanged;

  const GenderDropdown({
    Key? key,
    required this.selectedGender,
    required this.genderOptions,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedGender,
      items: genderOptions.map((String gender) {
        return DropdownMenuItem<String>(
          value: gender,
          child: Text(gender),
        );
      }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFE7ECF3),
        hintText: 'Gender',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
