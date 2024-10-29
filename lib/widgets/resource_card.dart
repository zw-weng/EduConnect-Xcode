import 'package:flutter/material.dart';
import 'package:educonnect/models/resource.dart'; // Ensure this points to your Resource model
import 'package:educonnect/constants/colors.dart'; // Import your color constants

class ResourceCard extends StatelessWidget {
  final Resource resource;
  final String installs;

  const ResourceCard({
    super.key,
    required this.resource,
    required this.installs,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(resource.icon, size: 35, color: kPrimaryColor), // Resource icon with kTextColor
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    resource.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        resource.type == "past_year" ? "Past Year Paper" :
                        resource.type == "notes" ? "Notes" : "Video",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 8), // Add spacing between text and icon
                      const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey), // Grey install icon
                      const SizedBox(width: 4), // Add spacing
                      Text(
                        "$installs installs",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
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
    );
  }
}
