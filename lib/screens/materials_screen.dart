import 'package:educonnect/screens/pdf_preview_screen.dart';
import 'package:flutter/material.dart';
import 'package:educonnect/models/course.dart';
import 'package:url_launcher/url_launcher.dart';

class MaterialsScreen extends StatelessWidget {
  final Course course;

  const MaterialsScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${course.name} Resources"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: course.resources.length,
        itemBuilder: (context, index) {
          final resource = course.resources[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(
                resource.isVideo ? Icons.video_library : Icons.picture_as_pdf,
                color: resource.isVideo ? Colors.blueAccent : Colors.redAccent,
              ),
              title: Text(
                resource.title,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                if (resource.isVideo) {
                  _launchURL(resource.url);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PdfPreviewScreen(pdfUrl: resource.url),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }

  // Function to launch a URL in the browser
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
