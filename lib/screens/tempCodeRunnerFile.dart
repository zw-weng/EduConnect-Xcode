import 'package:flutter/material.dart';
import '../models/tutor.dart';
import '../widgets/tutor_card.dart';

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
        title: const Text('Book a Tutor'),
      ),
      body: ListView.builder(
        itemCount: tutors.length,
        itemBuilder: (context, index) {
          return TutorCard(tutor: tutors[index]);
        },
      ),
    );
  }
}