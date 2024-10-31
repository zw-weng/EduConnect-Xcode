import 'package:flutter/material.dart';
import 'package:educonnect/constants/colors.dart';

class StatisticCard extends StatelessWidget {
  final int resourcesShared;
  final int installsAchieved;

  const StatisticCard({
    super.key,
    required this.resourcesShared,
    required this.installsAchieved,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Resources shared section
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.upload_file,
                  color: kPrimaryColor,
                  size: 32,
                ),
                const SizedBox(height: 8),
                Text(
                  "$resourcesShared",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Resources Shared",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            // Vertical divider
            Container(
              height: 50,
              width: 1,
              color: Colors.grey[300],
            ),
            // Installs achieved section
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.download,
                  color: kPrimaryColor,
                  size: 32,
                ),
                const SizedBox(height: 8),
                Text(
                  "$installsAchieved",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Installs Achieved",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
