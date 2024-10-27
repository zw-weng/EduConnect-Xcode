import 'package:flutter/material.dart';
import 'package:educonnect/models/resource.dart'; // Ensure this points to your Resource model
import 'package:educonnect/screens/pdf_preview_screen.dart'; // Ensure this points to your PDF preview screen

class MaterialsScreen extends StatefulWidget {
  final String subjectName;

  const MaterialsScreen({super.key, required this.subjectName});

  @override
  State<MaterialsScreen> createState() => _MaterialsScreenState();
}

class _MaterialsScreenState extends State<MaterialsScreen> {
  String selectedType = "all"; // Default filter type

  // Sample data, you can fetch this from a database or API
  final List<Resource> resources = [
    Resource(
      title: "Past Year Paper 1",
      pdfUrl: "assets/pdfs/2021 Negeri_Sembilan_MPSM Add_Maths K1.pdf",
      type: "past_year",
      icon: Icons.picture_as_pdf, // Icon for PDF
    ),
    Resource(
      title: "Past Year Paper 2",
      pdfUrl: "assets/pdfs/past_year2.pdf",
      type: "past_year",
      icon: Icons.picture_as_pdf,
    ),
    Resource(
      title: "Sample Notes",
      pdfUrl: "assets/pdfs/sample_notes.pdf",
      type: "notes",
      icon: Icons.note, // Icon for notes
    ),
    Resource(
      title: "Video Tutorial",
      pdfUrl: "assets/videos/tutorial.mp4",
      type: "video",
      icon: Icons.play_circle_fill, // Icon for video
    ),
    // Add more materials as needed
  ];

  Color _getIconColor(String type) {
    switch (type) {
      case "past_year":
        return Colors.red; // Color for past year papers
      case "notes":
        return Colors.blue; // Color for notes
      case "video":
        return Colors.green; // Color for videos
      default:
        return Colors.black; // Default color
    }
  }

  @override
  Widget build(BuildContext context) {
    // Filter resources based on selected type
    List<Resource> filteredResources = selectedType == "all"
        ? resources
        : resources.where((resource) => resource.type == selectedType).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.subjectName} Resources"),
      ),
      body: SingleChildScrollView( // Make the body scrollable
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filter chips
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 8.0,
                children: [
                  _buildFilterChip("All"),
                  _buildFilterChip("Past Year Papers"),
                  _buildFilterChip("Notes"),
                  _buildFilterChip("Videos"),
                ],
              ),
            ),
            const Divider(thickness: 2), // Add a divider for separation
            // Resource list
            Padding(
              padding: const EdgeInsets.all(16.0), // Add padding around the list
              child: ListView.builder(
                itemCount: filteredResources.length,
                shrinkWrap: true, // Allows ListView to fit within the scrollable area
                physics: const NeverScrollableScrollPhysics(), // Prevents nested scrolling issues
                itemBuilder: (context, index) {
                  return Card( // Use Card widget for better styling
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(
                        filteredResources[index].icon,
                        color: _getIconColor(filteredResources[index].type), // Set icon color
                      ),
                      title: Text(filteredResources[index].title),
                      onTap: () {
                        // Navigate to PDF preview page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PdfPreviewScreen(pdfUrl: filteredResources[index].pdfUrl),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    String filterType;

    switch (label) {
      case "Past Year Papers":
        filterType = "past_year";
        break;
      case "Notes":
        filterType = "notes";
        break;
      case "Videos":
        filterType = "video";
        break;
      default:
        filterType = "all";
    }

    return ChoiceChip(
      label: Text(label),
      selected: selectedType == filterType,
      onSelected: (bool selected) {
        setState(() {
          selectedType = selected ? filterType : "all"; // Update selected type
        });
      },
      selectedColor: Theme.of(context).primaryColor, // Use primary color for selected chip
      backgroundColor: Colors.grey[300], // Use a light background for unselected chips
      labelStyle: TextStyle(
        color: selectedType == filterType ? Colors.white : Colors.black,
      ),
    );
  }
}
