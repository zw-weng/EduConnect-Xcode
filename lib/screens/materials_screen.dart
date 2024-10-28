import 'package:flutter/material.dart';
import 'package:educonnect/models/resource.dart'; // Ensure this points to your Resource model
import 'package:educonnect/screens/pdf_preview_screen.dart'; // PDF preview screen
import 'package:educonnect/screens/video_preview_screen.dart'; // Video preview screen

class MaterialsScreen extends StatefulWidget {
  final String subjectName;
  final List<Resource> resources; // Add this line

  const MaterialsScreen({super.key, required this.subjectName, required this.resources}); // Update constructor

  @override
  State<MaterialsScreen> createState() => _MaterialsScreenState();
}

class _MaterialsScreenState extends State<MaterialsScreen> {
  String selectedType = "all"; // Default filter type

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
        ? widget.resources // Use only resources for the selected subject
        : widget.resources.where((resource) => resource.type == selectedType).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.subjectName} Resources"),
      ),
      body: SingleChildScrollView(
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
              padding: const EdgeInsets.all(16.0),
              child: filteredResources.isNotEmpty
                  ? ListView.builder(
                      itemCount: filteredResources.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            leading: Icon(
                              filteredResources[index].icon,
                              color: _getIconColor(filteredResources[index].type),
                            ),
                            title: Text(filteredResources[index].title),
                            onTap: () {
                              // Navigate to the appropriate preview screen based on resource type
                              if (filteredResources[index].type == 'video') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VideoPreviewScreen(videoUrl: filteredResources[index].pdfUrl),
                                  ),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PdfPreviewScreen(pdfUrl: filteredResources[index].pdfUrl),
                                  ),
                                );
                              }
                            },
                          ),
                        );
                      },
                    )
                  : const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'No resources available for this category.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
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
      selectedColor: Theme.of(context).primaryColor,
      backgroundColor: Colors.grey[300],
      labelStyle: TextStyle(
        color: selectedType == filterType ? Colors.white : Colors.black,
      ),
    );
  }
}
