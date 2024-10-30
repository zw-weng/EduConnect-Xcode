import 'package:flutter/material.dart';
import 'package:educonnect/models/tutor.dart';
import 'package:educonnect/widgets/session_card.dart';
import 'package:educonnect/constants/colors.dart';

class BookingScreen extends StatelessWidget {
  final Tutor tutor;

  const BookingScreen({super.key, required this.tutor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book Session',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
              ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Set the back arrow color to white
          onPressed: () => Navigator.pop(context),
        ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Sessions for ${tutor.name}',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: tutor.availableSessions.length,
                itemBuilder: (context, index) {
                  return SessionCard(
                    session: tutor.availableSessions[index],
                    onJoin: () {
                      Navigator.pop(context, tutor.availableSessions[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}