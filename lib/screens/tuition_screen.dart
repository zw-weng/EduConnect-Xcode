import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:educonnect/models/session.dart';
import 'package:educonnect/widgets/upcoming_session_card.dart'; // Import the UpcomingSessionCard
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
              // Carousel Slider for Upcoming Sessions
              CarouselSlider(
                items: upcomingSessions.map((session) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: UpcomingSessionCard(
                      session: session,
                      onJoin: () {}, // No need to handle tap here
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 300.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
              const SizedBox(height: 16.0),
              // Book a Tutor Button
              ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BookTutorScreen()),
                  );

                  if (result != null && result is Session) {
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
              const SizedBox(height: 16.0),
              // Calendar with Marked Dates
              TableCalendar(
                firstDay: DateTime.utc(2023, 1, 1),
                lastDay: DateTime.utc(2024, 12, 31),
                focusedDay: DateTime.now(),
                eventLoader: (day) {
                  return upcomingSessions
                      .where((session) => DateTime.parse(session.date).isSameDay(day))
                      .toList();
                },
                calendarStyle: const CalendarStyle(
                  markersMaxCount: 1,
                  markersAnchor: 1.0,
                  markerSizeScale: 0.3,
                  markerSize: 10.0,
                  markerDecoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
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

extension DateUtils on DateTime {
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}