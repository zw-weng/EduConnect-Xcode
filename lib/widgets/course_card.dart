import 'package:educonnect/models/course.dart';
import 'package:educonnect/models/resource.dart';
import 'package:educonnect/screens/materials_screen.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  final List<Resource> resources;

  const CourseCard({
    super.key,
    required this.course,
    required this.resources,
    required Null Function() onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the MaterialsScreen with the subject name and relevant resources
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MaterialsScreen(
              subjectName: course.name,
              resources: resources, // Pass resources
            ),
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
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  course.name,
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 2, // Allow up to 2 lines
                  overflow: TextOverflow.ellipsis, // Add ellipsis if text still overflows
                  textAlign: TextAlign.center, // Center-align the text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
