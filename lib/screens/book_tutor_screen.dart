import 'package:flutter/material.dart';
import 'package:educonnect/models/tutor.dart';
import 'package:educonnect/models/session.dart'; // Import the Session model
import 'package:educonnect/widgets/tuition_card.dart'; // Update the import
import 'package:educonnect/constants/colors.dart';
import 'package:educonnect/screens/tutor_detail_screen.dart'; // Import the TutorDetailScreen

class BookTutorScreen extends StatefulWidget {
  const BookTutorScreen({super.key});

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
        imageUrl: 'assets/images/jotaro.png',
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
        imageUrl: 'assets/images/siti.jpg',
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
        imageUrl: 'assets/images/suzana.jpg',
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
      body: Column(
        children: [
          SizedBox(
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
                return TuitionCard(
                  tutor: tutorsBySubject[_selectedSubjectIndex][index],
                  onBook: () async {
                    // Navigate to TutorDetailScreen
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TutorDetailScreen(tutor: tutorsBySubject[_selectedSubjectIndex][index]),
                      ),
                    );

                    if (result != null && result is Session) {
                      // Handle booking logic
                      Navigator.pop(context, result);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}