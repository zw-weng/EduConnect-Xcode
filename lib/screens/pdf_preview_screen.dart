import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfPreviewScreen extends StatelessWidget {
  final String pdfUrl;

  const PdfPreviewScreen({super.key, required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Preview"),
      ),
      body: PDFView(
        filePath: pdfUrl,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement download logic here if needed
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}
