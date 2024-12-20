import 'package:educonnect/constants/colors.dart';
import 'package:educonnect/widgets/floating_add_button.dart';
import 'package:flutter/material.dart';
import 'package:educonnect/models/course.dart';
import 'package:educonnect/models/resource.dart';
import 'package:educonnect/widgets/course_card.dart';

class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({super.key});

  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  final List<Course> courses = [
    Course(name: "Add Maths", iconPath: "assets/icons/addmath.png"),
    Course(name: "Biology", iconPath: "assets/icons/bio.png"),
    Course(name: "Computing", iconPath: "assets/icons/comp.png"),
    Course(name: "Chemistry", iconPath: "assets/icons/chemi.png"),
    Course(name: "Physics", iconPath: "assets/icons/phy.png"),
    Course(name: "English", iconPath: "assets/icons/eng.png"),
    Course(name: "Malay", iconPath: "assets/icons/malay.png"),
    Course(name: "History", iconPath: "assets/icons/hist.png"),
    Course(name: "Accounting", iconPath: "assets/icons/acc.png"),
    Course(name: "Arts", iconPath: "assets/icons/arts.png"),
    Course(name: "Business", iconPath: "assets/icons/business.png"),
  ];

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
        icon: Icons.picture_as_pdf,
      ),
      // Additional resources...
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
        icon: Icons.picture_as_pdf,
      ),
      // Additional resources...
    ],
    "Chemistry": [
      Resource(
        title: "Thermochemistry",
        pdfUrl: "https://youtu.be/9Eb1LX87TY0?si=Sxj3FYaB3RNexTii",
        type: "video",
        icon: Icons.video_library,
      ),
       Resource(
        title: "Energy Changes in Chemical Reactions",
        pdfUrl: "assets/pdfs/Energy Changes in Chemical Reactions.pdf",
        type: "notes",
        icon: Icons.picture_as_pdf,
      ),
      // Additional resources...
    ],
    "Computing": [
      Resource(
        title: "Web Development Full Course by FreeCodeCamp",
        pdfUrl: "https://youtu.be/nu_pCVPKzTk?si=mSPwNViTEKi0qHYM",
        type: "video",
        icon: Icons.video_library,
      ),
      // Additional resources...
    ],
    // Add resources for other subjects similarly
  };

  void _onResourceAdded(String courseName, Resource newResource) {
    setState(() {
      courseResources[courseName] = [
        ...courseResources[courseName] ?? [],
        newResource,
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Course Resources",
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
                kPrimaryLight, // Light gradient color
                kPrimaryColor, // Dark gradient color
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: kBackColor,
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
                onTap: () {},
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingAddButton(
        courses: courses,
        onResourceAdded: _onResourceAdded,
      ),
    );
  }
}
