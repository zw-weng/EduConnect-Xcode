import 'package:flutter/material.dart';
import '../models/session.dart';

class SessionCard extends StatelessWidget {
  final Session session;
  final VoidCallback onJoin;


  SessionCard({required this.session, required this.onJoin});
=======
  const SessionCard({super.key, required this.session});


  @override
  Widget build(BuildContext context) {
    return Card(

      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4.0,
=======
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4.0, // Add shadow

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              session.tutorName,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Subject: ${session.subject}',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(

              'Date: ${session.date}',
              style: TextStyle(
=======
              'Date: ${session.date}', // Display the String date
              style: const TextStyle(

                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(

              'Time: ${session.startTime} - ${session.endTime}',
              style: TextStyle(
=======
              'Time: ${session.startTime} - ${session.endTime}', // Display the String time
              style: const TextStyle(

                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: onJoin,
              style: ElevatedButton.styleFrom(

                backgroundColor: const Color.fromARGB(255, 154, 41, 206),
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
=======
                backgroundColor: const Color.fromARGB(255, 154, 41, 206), // Button color
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

              ),
              child: const Text(
                'Join',
                style: TextStyle(
                  fontSize: 16.0,
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