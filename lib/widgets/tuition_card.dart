import 'package:educonnect/constants/colors.dart';
import 'package:flutter/material.dart';
import '../models/tutor.dart';

class TuitionCard extends StatelessWidget {
  final Tutor tutor;
  final VoidCallback onBook;

  const TuitionCard({super.key, required this.tutor, required this.onBook});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBook,
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
                  height: 80, // Set a fixed height for the image
                  width: 80, // Set a fixed width for the image
                  fit: BoxFit.cover, // Cover the area while maintaining aspect ratio
                ),
              ),
              const SizedBox(width: 16), // Space between image and text

              // Column for text information on the right side
              Expanded(
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
                        color: kTextColor,
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
                            color: kTextColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}