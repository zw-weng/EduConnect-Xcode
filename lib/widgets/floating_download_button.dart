import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:external_path/external_path.dart';

class FloatingDownloadButton extends StatelessWidget {
  final String pdfUrl;
  final String fileName;

  const FloatingDownloadButton({Key? key, required this.pdfUrl, required this.fileName}) : super(key: key);

  Future<void> _downloadPdf(BuildContext context) async {
    try {
      // Load the PDF data
      final ByteData bytes = await rootBundle.load(pdfUrl);
      final Uint8List data = bytes.buffer.asUint8List();

      // Get the external storage path to save the file
      final directory = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
      final filePath = '$directory/$fileName.pdf';

      // Write the file
      final file = File(filePath);
      await file.writeAsBytes(data);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("PDF downloaded to: $filePath")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to download PDF")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _downloadPdf(context),
      child: const Icon(Icons.download),
      tooltip: 'Download PDF',
    );
  }
}
