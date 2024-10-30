import 'package:educonnect/constants/colors.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey,
          size: 26,
        ),
        suffixIcon: Icon(
          Icons.mic,
          color: kPrimaryColor,
          size: 26,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: "Search your topic",
        labelStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none, // No border
        enabledBorder: InputBorder.none, // No border when enabled
        focusedBorder: InputBorder.none, // No border when focused
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Adjust padding as needed
      ),
    );
  }
}
