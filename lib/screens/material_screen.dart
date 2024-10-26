import 'package:flutter/material.dart';
import 'package:educonnect/models/resource.dart'; // Ensure this points to your Material model
import 'package:educonnect/screens/pdf_preview_screen.dart'; // Ensure this points to your PDF preview screen

class MaterialsScreen extends StatelessWidget {
  final String subjectName;

  // Sample data, you can fetch this from a database or API
  final List<Resource> resources = [
    Resource(title: "Sample PDF 1", pdfUrl: "assets/pdfs/sample1.pdf"),
    Resource(title: "Sample PDF 2", pdfUrl: "assets/pdfs/sample2.pdf"),
    // Add more materials as needed
  ];

  MaterialsScreen({super.key, required this.subjectName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$subjectName Resources"),
      ),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(resources[index].title),
            onTap: () {
              // Navigate to PDF preview page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PdfPreviewScreen(pdfUrl: resources[index].pdfUrl),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
