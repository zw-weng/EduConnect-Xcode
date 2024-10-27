import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart'; // Import the document picker
import 'package:educonnect/models/course.dart';
import 'package:educonnect/models/resource.dart';

class AddResourceScreen extends StatefulWidget {
  final List<Course> courses;

  const AddResourceScreen({super.key, required this.courses});

  @override
  _AddResourceScreenState createState() => _AddResourceScreenState();
}

class _AddResourceScreenState extends State<AddResourceScreen> {
  String? selectedCourse;
  String selectedType = 'past_year'; // Default type
  String title = '';
  String? videoUrl; // For storing video URL
  String? selectedFilePath; // For storing PDF file path

  void _pickFile() async {
    // Use flutter_document_picker to pick a document
    String? path = await FlutterDocumentPicker.openDocument(
      params: FlutterDocumentPickerParams(
        allowedMimeTypes: ['application/pdf'], // Specify allowed MIME types
      ),
    );

    if (path != null) {
      setState(() {
        selectedFilePath = path; // Store the path of the selected file
      });
    }
  }

  void _addResource() {
    if (selectedCourse != null && title.isNotEmpty && (selectedType == 'video' ? videoUrl != null : selectedFilePath != null)) {
      Resource newResource = Resource(
        title: title,
        pdfUrl: selectedType == 'video' ? videoUrl! : selectedFilePath!, // Use file path if not video
        type: selectedType,
        icon: selectedType == 'video' ? Icons.play_circle_fill : Icons.picture_as_pdf,
      );

      // Logic to save the resource to the selected course's resources
      // For now, let's just print it to the console
      print('New resource added: ${newResource.title}');

      Navigator.pop(context); // Go back after adding the resource
    } else {
      // Show an error message if any required field is missing
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please complete all fields.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Resource"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedCourse,
              hint: const Text("Select Course"),
              onChanged: (value) {
                setState(() {
                  selectedCourse = value;
                });
              },
              items: widget.courses.map((course) {
                return DropdownMenuItem(
                  value: course.name,
                  child: Text(course.name),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(labelText: "Title"),
              onChanged: (value) {
                setState(() {
                  title = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text('Past Year Paper'),
                    leading: Radio<String>(
                      value: 'past_year',
                      groupValue: selectedType,
                      onChanged: (value) {
                        setState(() {
                          selectedType = value!;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('Notes'),
                    leading: Radio<String>(
                      value: 'notes',
                      groupValue: selectedType,
                      onChanged: (value) {
                        setState(() {
                          selectedType = value!;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('Video'),
                    leading: Radio<String>(
                      value: 'video',
                      groupValue: selectedType,
                      onChanged: (value) {
                        setState(() {
                          selectedType = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (selectedType == 'video') ...[
              TextField(
                decoration: const InputDecoration(labelText: "Video URL"),
                onChanged: (value) {
                  setState(() {
                    videoUrl = value;
                  });
                },
              ),
            ] else ...[
              ElevatedButton(
                onPressed: _pickFile,
                child: const Text("Upload PDF"),
              ),
              if (selectedFilePath != null) Text("Selected File: $selectedFilePath"),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addResource,
              child: const Text("Add Resource"),
            ),
          ],
        ),
      ),
    );
  }
}
