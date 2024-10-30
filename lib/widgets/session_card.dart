import 'package:flutter/material.dart';
import 'package:educonnect/models/session.dart';
import 'package:educonnect/constants/colors.dart'; // Import the colors

class SessionCard extends StatelessWidget {
  final Session session;
  final VoidCallback onJoin;

  const SessionCard({super.key, required this.session, required this.onJoin});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width *
          0.75, // Adjust width to fit carousel
      height: 220.0,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                session.tutorName,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8.0),
              Text(
                'Subject: ${session.subject}',
                style: const TextStyle(fontSize: 16.0),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8.0),
              Text(
                'Date: ${session.date}',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Time: ${session.startTime} - ${session.endTime}',
                style: const TextStyle(fontSize: 16.0),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: onJoin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryLight, // Set to kPrimaryLight
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.0), // Optional rounded corners
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.play_arrow, // Join icon
                        color: Colors.white,
                        size: 20.0,
                      ),
                      SizedBox(width: 6.0), // Space between icon and text
                      Text(
                        'Join',
                        style: TextStyle(
                          color: Colors.white, // White font color
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
