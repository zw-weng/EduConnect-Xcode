import 'package:educonnect/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:educonnect/models/course.dart';
import 'package:educonnect/widgets/course_card.dart';

class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({super.key});

  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  // Updated list of courses (Subjects)
  final List<Course> courses = [
    Course(name: "Add Maths", iconPath: "assets/icons/addmath.png"),
    Course(name: "Biology", iconPath: "assets/icons/bio.png"),
    Course(name: "Physics", iconPath: "assets/icons/phy.png"),
    Course(name: "Maths", iconPath: "assets/icons/addmath.png"),
    Course(name: "Science", iconPath: "assets/icons/bio.png"),
    Course(name: "History", iconPath: "assets/icons/phy.png"),
    Course(name: "Geography", iconPath: "assets/icons/phy.png"),
    Course(name: "English", iconPath: "assets/icons/phy.png"),
    Course(name: "Art", iconPath: "assets/icons/phy.png"),
    // Add more courses as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Your Subject",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
              ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.5],
              colors: [
                kPrimaryLight,
                kPrimaryColor,
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFFF5F9FF), // Background color
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 1.2,
            ),
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return CourseCard(course: courses[index]);
            },
          ),
        ),
      ),
    );
  }
}