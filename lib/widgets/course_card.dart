import 'package:flutter/material.dart';
import 'package:educonnect/models/course.dart';
import 'package:educonnect/screens/materials_screen.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MaterialsScreen(course: course),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Image.asset(course.iconPath, height: 64, width: 64),
            const SizedBox(height: 8),
            Text(course.name),
          ],
        ),
      ),
    );
  }
}
