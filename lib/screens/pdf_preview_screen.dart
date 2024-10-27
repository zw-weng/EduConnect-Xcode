import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:flutter/services.dart';

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
      final ByteData bytes = await rootBundle.load(widget.pdfUrl);
      final Uint8List data = bytes.buffer.asUint8List();

      // Load the PDF document
      final document = await PdfDocument.openData(data);

      // Initialize the controller with the loaded document
      _pdfController = PdfController(document: Future.value(document));

      setState(() {
        totalPages = document.pagesCount;
      });
    } catch (e) {
      print("Error loading PDF: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to load PDF")),
      );
    }
  }

  void _goToNextPage() {
    if (_pdfController != null && currentPage < totalPages) {
      setState(() => currentPage++);
      _pdfController!.jumpToPage(currentPage - 1);
    }
  }

  void _goToPreviousPage() {
    if (_pdfController != null && currentPage > 1) {
      setState(() => currentPage--);
      _pdfController!.jumpToPage(currentPage - 1);
    }
  }

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Viewer"),
        backgroundColor: Colors.red,
      ),
      body: _pdfController == null
          ? const Center(child: CircularProgressIndicator()) // Show loading indicator while PDF loads
          : Column(
              children: [
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
    );
  }

  @override
  void dispose() {
    _pdfController?.dispose();
    super.dispose();
  }
}
