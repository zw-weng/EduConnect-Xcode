import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:educonnect/models/session.dart';
import 'package:educonnect/widgets/session_card.dart';
import 'package:educonnect/constants/colors.dart';
import 'package:educonnect/screens/book_tutor_screen.dart';

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

  void showSessionDetails(Session session) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Session Details"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Tutor: ${session.tutorName}"),
              Text("Subject: ${session.subject}"),
              Text("Date: ${session.date}"),
              Text("Time: ${session.startTime} - ${session.endTime}"),
              const SizedBox(height: 10),
              Text("Rules:"),
              Text("1. Be active during the session."),
              Text("2. Complete any assigned homework."),
              Text("3. Respect your tutor and peers."),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
              },
              child: Text(
                "Cancel",
                style: TextStyle(color: kTextColor), // Text color for cancel
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                // Implement the logic to enter the session here
                // For example, navigate to a session video/chat screen
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Entering the session...'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor, // Background color for button
              ),
              child: const Text(
                "Enter Session",
                style: TextStyle(color: Colors.white), // White text for button
              ),
            ),
          ],
        );
      },
    );
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
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFF5F9FF), // Background color
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Horizontal Scroll for Upcoming Sessions
              SizedBox(
                height: 220.0,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: upcomingSessions.map((session) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SessionCard(
                          session: session,
                          onJoin: () {
                            showSessionDetails(session);
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              // Book a Tutor Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BookTutorScreen()),
                    );

                    if (result != null && result is Session) {
                      addSession(result);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Booking successful!'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        kPrimaryColor, // Use kPrimaryColor for background
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12.0), // Rounded corners
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 16.0),
                  ),
                  child: const Text(
                    'Book a Tutor',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white, // White font color
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              // Calendar with Marked Dates
              TableCalendar(
                firstDay: DateTime.utc(2023, 1, 1),
                lastDay: DateTime.utc(2024, 12, 31),
                focusedDay: DateTime.now(), // Always focus on today
                selectedDayPredicate: (day) => isSameDay(DateTime.now(), day),
                eventLoader: (day) {
                  return upcomingSessions
                      .where((session) =>
                          DateTime.parse(session.date).isSameDay(day))
                      .toList();
                },
                calendarStyle: const CalendarStyle(
                  markersMaxCount: 1,
                  markersAnchor: 1.0,
                  markerSizeScale: 0.3,
                  markerSize: 10.0,
                  markerDecoration: BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                ),
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible:
                      false, // Hides the format button (if present)
                  titleTextStyle: TextStyle(
                    color:
                        Colors.black, // You can set the color as per your theme
                    fontSize: 20.0, // Set the desired font size
                  ),
                  leftChevronIcon: Icon(Icons.chevron_left),
                  rightChevronIcon: Icon(Icons.chevron_right),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension DateUtils on DateTime {
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
