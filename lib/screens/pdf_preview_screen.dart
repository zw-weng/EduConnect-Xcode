import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as path; // Import the path package
import 'package:educonnect/widgets/floating_download_button.dart';

class PdfPreviewScreen extends StatefulWidget {
  final String pdfUrl;

  const PdfPreviewScreen({super.key, required this.pdfUrl});

  @override
  _PdfPreviewScreenState createState() => _PdfPreviewScreenState();
}

class _PdfPreviewScreenState extends State<PdfPreviewScreen> {
  PdfController? _pdfController;
  int totalPages = 0;
  int currentPage = 1;

  Future<void> _loadPdf() async {
    try {
      // Check if the PDF is stored as an asset
      if (widget.pdfUrl.startsWith('assets/')) {
        final ByteData bytes = await rootBundle.load(widget.pdfUrl);
        final Uint8List data = bytes.buffer.asUint8List();
        final document = await PdfDocument.openData(data);
        _pdfController = PdfController(document: Future.value(document));
      } else {
        // Load PDF from file path (e.g., documents directory)
        final document = await PdfDocument.openFile(widget.pdfUrl);
        _pdfController = PdfController(document: Future.value(document));
      }

      final document = await _pdfController!.document;
      setState(() {
        totalPages = document.pagesCount; // Get total pages from the document
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to load PDF")),
      );
    }
  }

  void _goToNextPage() {
    if (_pdfController != null && currentPage < totalPages) {
      currentPage++;
      _pdfController!.jumpToPage(currentPage - 1);
      setState(() {}); // Call setState after updating currentPage
    }
  }

  void _goToPreviousPage() {
    if (_pdfController != null && currentPage > 1) {
      currentPage--;
      _pdfController!.jumpToPage(currentPage - 1);
      setState(() {}); // Call setState after updating currentPage
    }
  }

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  @override
  Widget build(BuildContext context) {
    // Extract the filename from pdfUrl
    final fileName = path.basename(widget.pdfUrl);

    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Viewer"),
      ),
      body: _pdfController == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(fileName), // Display the PDF file name
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Total Pages: $totalPages"),
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: _goToPreviousPage,
                        tooltip: 'Previous Page',
                      ),
                      Text("Current Page: $currentPage"),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: _goToNextPage,
                        tooltip: 'Next Page',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: PdfView(
                    controller: _pdfController!,
                    scrollDirection: Axis.vertical,
                    onPageChanged: (page) {
                      setState(() => currentPage = page + 1);
                    },
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingDownloadButton(
        pdfUrl: widget.pdfUrl,
        fileName: fileName, // Pass the real file name to the download button
      ),
    );
  }

  @override
  void dispose() {
    _pdfController?.dispose();
    super.dispose();
  }
}
