import 'package:flutter/material.dart';
import '../models/session.dart';
import '../widgets/session_card.dart';
import '../constants/colors.dart';
import 'book_tutor_screen.dart';


class TuitionScreen extends StatefulWidget {
  const TuitionScreen({super.key});

  @override
  State<TuitionScreen> createState() => _TuitionScreenState();
}

class _TuitionScreenState extends State<TuitionScreen> {
  List<Session> upcomingSessions = [
    Session(
      tutorName: 'John Doe',
      subject: 'Mathematics',
      date: '2023-10-01',
      startTime: '10:00 AM',
      endTime: '11:00 AM',
    ),
    Session(
      tutorName: 'Jane Smith',
      subject: 'Science',
      date: '2023-10-02',
      startTime: '02:00 PM',
      endTime: '03:00 PM',
    ),
    // Add more sessions as needed
  ];

  void addSession(Session session) {
    setState(() {
      upcomingSessions.add(session);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Upcoming Sessions",
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
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: upcomingSessions.length,
                itemBuilder: (context, index) {
                  return SessionCard(
                    session: upcomingSessions[index],
                    onJoin: () {}, // No need to handle tap here
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BookTutorScreen()),
                );

                if (result != null) {
                  // Handle booking logic
                  addSession(result);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Booking successful!'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 154, 41, 206), // Button color
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              ),
              child: const Text(
                'Book a Tutor',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}