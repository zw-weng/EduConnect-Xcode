import 'package:educonnect/screens/add_resource_screen.dart';
import 'package:flutter/material.dart';
import 'package:educonnect/models/course.dart';
import 'package:educonnect/models/resource.dart';

class FloatingAddButton extends StatelessWidget {
  final List<Course> courses;
  final Function(String, Resource) onResourceAdded;

  const FloatingAddButton({
    Key? key,
    required this.courses,
    required this.onResourceAdded,
  }) : super(key: key);

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
      backgroundColor: Colors.blue, // Use your desired color
      child: const Icon(Icons.add),
    );
  }
}
