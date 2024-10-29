import 'package:educonnect/screens/tutor_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:educonnect/models/tutor.dart';

class TutorCard extends StatelessWidget {
  final Tutor tutor;

  const TutorCard({super.key, required this.tutor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TutorDetailScreen(tutor: tutor),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display tutor image on the left side
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  tutor.imageUrl,
                  height: double.infinity, // Set height to match the card's height
                  width: 100, // Increased width for the image
                  fit: BoxFit.cover, // Cover the area while maintaining aspect ratio
                ),
              ),
              const SizedBox(width: 16), // Space between image and text

              // Column for text information on the right side
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Display tutor name with softWrap
                      Text(
                        tutor.name,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        softWrap: true, // Allow text to wrap to the next line
                      ),
                      const SizedBox(height: 5),
                      // Display tutor course
                      Text(
                        tutor.course,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Display rating
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 5),
                          Text(
                            tutor.rating.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10), // Space between rating and icon with text
                      // Icon with text "View Me"
                      Row(
                        children: [
                          const Icon(Icons.visibility, color: Colors.blue),
                          const SizedBox(width: 5),
                          const Text(
                            'View Me',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
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