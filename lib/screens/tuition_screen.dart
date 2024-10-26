import 'package:flutter/material.dart';
import '../models/tutor.dart';
import '../widgets/tutor_card.dart';
import '../constants/colors.dart'; // Ensure you have this file with your color constants

class TuitionScreen extends StatefulWidget {
  const TuitionScreen({super.key});

  @override
  State<TuitionScreen> createState() => _TuitionScreenState();
}

class _TuitionScreenState extends State<TuitionScreen> {
  List<Tutor> tutors = [
    Tutor(
      name: 'John Doe',
      subject: 'Mathematics',
      rating: 4.5,
      description: 'Experienced math tutor with 10 years of teaching experience.',
      imageUrl: 'https://example.com/john_doe.jpg',
      course: 'Algebra',
    ),
    Tutor(
      name: 'Jane Smith',
      subject: 'Science',
      rating: 4.7,
      description: 'Passionate science tutor with a focus on practical learning.',
      imageUrl: 'https://example.com/jane_smith.jpg',
      course: 'Biology',
    ),
    // Add more tutors as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Book a Tutor',
          style: TextStyle(
            color: Colors.white, // White text color
          ),
        ),
        centerTitle: true, // Center the title
        backgroundColor: kPrimaryColor, // Purple background color
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
            itemCount: tutors.length,
            itemBuilder: (context, index) {
              return TutorCard(tutor: tutors[index]);
            },
          ),
        ),
      ),
    );
  }
}