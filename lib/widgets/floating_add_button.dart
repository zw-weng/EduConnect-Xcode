import 'package:educonnect/constants/colors.dart';
import 'package:educonnect/screens/add_resource_screen.dart';
import 'package:flutter/material.dart';
import 'package:educonnect/models/course.dart';
import 'package:educonnect/models/resource.dart';

class FloatingAddButton extends StatelessWidget {
  final List<Course> courses;
  final Function(String, Resource) onResourceAdded;

  const FloatingAddButton({
    super.key,
    required this.courses,
    required this.onResourceAdded,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddResourceScreen(
              courses: courses,
              onResourceAdded: onResourceAdded,
            ),
          ),
        );
      },
      backgroundColor: kPrimaryLight, // Use your desired color
      child: const Icon(Icons.add),
    );
  }
}
