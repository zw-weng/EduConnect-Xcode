import 'package:educonnect/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:educonnect/models/course.dart';
import 'package:educonnect/models/resource.dart';
import 'package:educonnect/widgets/course_card.dart';
import 'add_resource_screen.dart'; // Import AddResourceScreen

class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({super.key});

  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  // List of courses (Subjects)
  final List<Course> courses = [
    Course(name: "Add Maths", iconPath: "assets/icons/addmath.png"),
    Course(name: "Biology", iconPath: "assets/icons/bio.png"),
    Course(name: "Physics", iconPath: "assets/icons/phy.png"),
    Course(name: "English", iconPath: "assets/icons/eng.png"),
    Course(name: "Chemistry", iconPath: "assets/icons/chemi.png"),
    // Add more courses as needed
  ];

  // Sample resources for each course
  final Map<String, List<Resource>> courseResources = {
    "Add Maths": [
      Resource(
        title: "2021 Negeri_Sembilan_MPSM Add_Maths K1",
        pdfUrl: "assets/pdfs/2021 Negeri_Sembilan_MPSM Add_Maths K1.pdf",
        type: "past_year",
        icon: Icons.picture_as_pdf,
      ),
      Resource(
        title: "2021 Negeri_Sembilan_MPSM Add_Maths K1 Answer",
        pdfUrl: "assets/pdfs/2021 Negeri_Sembilan_MPSM Add_Maths K1 Jawapan.pdf",
        type: "past_year",
        icon: Icons.picture_as_pdf,
      ),
      Resource(
        title: "Calculus Cheat Sheet",
        pdfUrl: "assets/pdfs/calculus cheat sheet.pdf",
        type: "notes",
        icon: Icons.note,
      ),
    ],
    "Biology": [
      Resource(
        title: "Cell Organization",
        pdfUrl: "https://youtu.be/9Eb1LX87TY0?si=Sxj3FYaB3RNexTii",
        type: "video",
        icon: Icons.video_library,
      ),
      Resource(
        title: "Enzymes Cheat Sheet",
        pdfUrl: "assets/pdfs/enzymes cheat sheet.pdf",
        type: "notes",
        icon: Icons.note,
      ),
    ],
    // Add resources for other subjects similarly
  };

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
              return CourseCard(
                course: courses[index],
                resources: courseResources[courses[index].name] ?? [],
                onTap: () {}, // Pass the corresponding resources
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the AddResourceScreen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddResourceScreen(courses: courses),
            ),
          );
        },
        backgroundColor: kPrimaryColor, // Customize the FAB color
        child: const Icon(Icons.add),
      ),
    );
  }
}
