import 'package:flutter/material.dart';
import '../models/tutor.dart';
import '../models/session.dart'; // Import the Session model
import '../widgets/tutor_card.dart';
import '../constants/colors.dart';

class BookTutorScreen extends StatefulWidget {
  @override
  _BookTutorScreenState createState() => _BookTutorScreenState();
}

class _BookTutorScreenState extends State<BookTutorScreen> {
  int _selectedSubjectIndex = 0;

  final List<String> subjects = [
    'AddMaths',
    'Biology',
    'Physics',
    'Maths',
    'Science',
    'History',
    'Geography',
    'English',
    'Art',
  ];

  final List<List<Tutor>> tutorsBySubject = [
    [
      Tutor(
        name: 'John Doe',
        subject: 'AddMaths',
        rating: 4.5,
        description: 'Experienced math tutor with 10 years of teaching experience.',
        imageUrl: 'https://example.com/john_doe.jpg',
        course: 'Algebra',
        availableSessions: [
          Session(
            tutorName: 'John Doe',
            subject: 'AddMaths',
            date: '2023-10-01',
            startTime: '10:00 AM',
            endTime: '11:00 AM',
          ),
          // Add more sessions as needed
        ],
      ),
      // Add more AddMaths tutors as needed
    ],
    [
      Tutor(
        name: 'Jane Smith',
        subject: 'Biology',
        rating: 4.7,
        description: 'Passionate science tutor with a focus on practical learning.',
        imageUrl: 'https://example.com/jane_smith.jpg',
        course: 'Biology',
        availableSessions: [
          Session(
            tutorName: 'Jane Smith',
            subject: 'Biology',
            date: '2023-10-02',
            startTime: '02:00 PM',
            endTime: '03:00 PM',
          ),
          // Add more sessions as needed
        ],
      ),
      // Add more Biology tutors as needed
    ],
    [
      Tutor(
        name: 'Alice Johnson',
        subject: 'Physics',
        rating: 4.6,
        description: 'Expert in physics with a focus on conceptual understanding.',
        imageUrl: 'https://example.com/alice_johnson.jpg',
        course: 'Physics',
        availableSessions: [
          Session(
            tutorName: 'Alice Johnson',
            subject: 'Physics',
            date: '2023-10-03',
            startTime: '03:00 PM',
            endTime: '04:00 PM',
          ),
          // Add more sessions as needed
        ],
      ),
      // Add more Physics tutors as needed
    ],
    [
      Tutor(
        name: 'Bob Brown',
        subject: 'Maths',
        rating: 4.4,
        description: 'Skilled math tutor with a focus on problem-solving.',
        imageUrl: 'https://example.com/bob_brown.jpg',
        course: 'Calculus',
        availableSessions: [
          Session(
            tutorName: 'Bob Brown',
            subject: 'Maths',
            date: '2023-10-04',
            startTime: '04:00 PM',
            endTime: '05:00 PM',
          ),
          // Add more sessions as needed
        ],
      ),
      // Add more Maths tutors as needed
    ],
    [
      Tutor(
        name: 'Charlie Davis',
        subject: 'Science',
        rating: 4.8,
        description: 'Versatile science tutor with a focus on interdisciplinary learning.',
        imageUrl: 'https://example.com/charlie_davis.jpg',
        course: 'Chemistry',
        availableSessions: [
          Session(
            tutorName: 'Charlie Davis',
            subject: 'Science',
            date: '2023-10-05',
            startTime: '05:00 PM',
            endTime: '06:00 PM',
          ),
          // Add more sessions as needed
        ],
      ),
      // Add more Science tutors as needed
    ],
    [
      Tutor(
        name: 'Diana Evans',
        subject: 'History',
        rating: 4.3,
        description: 'Passionate history tutor with a focus on critical thinking.',
        imageUrl: 'https://example.com/diana_evans.jpg',
        course: 'World History',
        availableSessions: [
          Session(
            tutorName: 'Diana Evans',
            subject: 'History',
            date: '2023-10-06',
            startTime: '06:00 PM',
            endTime: '07:00 PM',
          ),
          // Add more sessions as needed
        ],
      ),
      // Add more History tutors as needed
    ],
    [
      Tutor(
        name: 'Edward Frank',
        subject: 'Geography',
        rating: 4.5,
        description: 'Experienced geography tutor with a focus on global awareness.',
        imageUrl: 'https://example.com/edward_frank.jpg',
        course: 'Geography',
        availableSessions: [
          Session(
            tutorName: 'Edward Frank',
            subject: 'Geography',
            date: '2023-10-07',
            startTime: '07:00 PM',
            endTime: '08:00 PM',
          ),
          // Add more sessions as needed
        ],
      ),
      // Add more Geography tutors as needed
    ],
    [
      Tutor(
        name: 'Grace Green',
        subject: 'English',
        rating: 4.7,
        description: 'Skilled English tutor with a focus on language and literature.',
        imageUrl: 'https://example.com/grace_green.jpg',
        course: 'English Literature',
        availableSessions: [
          Session(
            tutorName: 'Grace Green',
            subject: 'English',
            date: '2023-10-08',
            startTime: '08:00 PM',
            endTime: '09:00 PM',
          ),
          // Add more sessions as needed
        ],
      ),
      // Add more English tutors as needed
    ],
    [
      Tutor(
        name: 'Henry Hill',
        subject: 'Art',
        rating: 4.6,
        description: 'Creative art tutor with a focus on visual arts and design.',
        imageUrl: 'https://example.com/henry_hill.jpg',
        course: 'Art History',
        availableSessions: [
          Session(
            tutorName: 'Henry Hill',
            subject: 'Art',
            date: '2023-10-09',
            startTime: '09:00 PM',
            endTime: '10:00 PM',
          ),
          // Add more sessions as needed
        ],
      ),
      // Add more Art tutors as needed
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Book a Tutor",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
              ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.1, 0.5],
              colors: [
                kPrimaryLight,
                kPrimaryColor,
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedSubjectIndex = index;
                      });
                    },
                    child: Chip(
                      label: Text(subjects[index]),
                      backgroundColor: _selectedSubjectIndex == index ? kPrimaryColor : Colors.grey[300],
                      labelStyle: TextStyle(
                        color: _selectedSubjectIndex == index ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tutorsBySubject[_selectedSubjectIndex].length,
              itemBuilder: (context, index) {
                return TutorCard(tutor: tutorsBySubject[_selectedSubjectIndex][index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}