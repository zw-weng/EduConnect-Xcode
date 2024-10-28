import 'package:educonnect/constants/colors.dart';
import 'package:educonnect/models/resource.dart';
import 'package:educonnect/models/session.dart';
import 'package:educonnect/widgets/resource_card.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:educonnect/widgets/search_field.dart';
import 'package:educonnect/widgets/tutor_card.dart'; // Define a TutorCard widget for slidable tutors
import 'package:educonnect/models/tutor.dart'; // Define Tutor model

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Tutor> tutors = [
    Tutor(
      name: "Jotaro",
      rating: 4.8,
      imageUrl: 'assets/images/jotaro.png',
      course: 'Physics',
      subject: 'Science',
      description: 'Experienced Physics tutor',
      availableSessions: [
        Session(
          tutorName: 'Grace Green',
          subject: 'English',
          date: '2023-10-08',
          startTime: '08:00 PM',
          endTime: '09:00 PM',
        ),
      ],
    ),
    Tutor(
      name: "Siti Norleha",
      rating: 5.0,
      imageUrl: 'assets/images/siti.jpg',
      course: 'Add Math',
      subject: 'Mathematics',
      description: 'Expert in Additional Mathematics',
      availableSessions: [
        Session(
          tutorName: 'Henry Hill',
          subject: 'Art',
          date: '2023-10-09',
          startTime: '09:00 PM',
          endTime: '10:00 PM',
        ),
      ],
    ),
    Tutor(
      name: "Suzana Li",
      rating: 4.8,
      imageUrl: 'assets/images/suzana.jpg',
      course: 'Biology',
      subject: 'Science',
      description: 'Professional Coding instructor',
      availableSessions: [
        Session(
          tutorName: 'Edward Frank',
          subject: 'Geography',
          date: '2023-10-07',
          startTime: '07:00 PM',
          endTime: '08:00 PM',
        ),
      ],
    ),
  ];

  final List<Resource> topResources = [
    Resource(
      title: "Calculus Past Year Papers",
      type: "past_year",
      pdfUrl: "assets/pdfs/calculus_papers.pdf",
      icon: Icons.assignment,
    ),
    Resource(
      title: "Introduction to Programming Notes",
      type: "notes",
      pdfUrl: "assets/pdfs/programming_notes.pdf",
      icon: Icons.notes,
    ),
    Resource(
      title: "Web Development Video Tutorial",
      type: "video",
      pdfUrl: "https://www.example.com/video",
      icon: Icons.videocam,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                "Recommended Tutors",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(height: 160, enlargeCenterPage: true, enableInfiniteScroll: true),
              items: tutors.map((tutor) {
                return TutorCard(tutor: tutor); // Create a custom TutorCard widget
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Resources This Month",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: topResources.map((resource) {
                  return ResourceCard(
                    resource: resource,
                    installs: '1000+',
                  );
                }).toList(),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 220,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello,\nGood Morning",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Welcome back!",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white70,
                        ),
                  ),
                ],
              ),
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/malaysia-flag-1.jpg'), // Fixed asset path
                radius: 25,
              ),
            ],
          ),
          const SizedBox(height: 20),
          const SearchField(),
        ],
      ),
    );
  }
}
