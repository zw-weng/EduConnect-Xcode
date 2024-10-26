import 'package:educonnect/models/course.dart';
import 'package:educonnect/screens/material_screen.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the MaterialsScreen with the subject name
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MaterialsScreen(subjectName: course.name),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(course.iconPath, height: 60), // Display the icon
              const SizedBox(height: 10),
              Text(
                course.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
