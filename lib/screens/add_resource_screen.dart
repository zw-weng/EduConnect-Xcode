import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:educonnect/models/course.dart';
import 'package:educonnect/models/resource.dart';
import 'dart:io';

class AddResourceScreen extends StatefulWidget {
  final List<Course> courses;
  final void Function(String courseName, Resource newResource) onResourceAdded;

  const AddResourceScreen({
    super.key,
    required this.courses,
    required this.onResourceAdded,
  });

  @override
  _AddResourceScreenState createState() => _AddResourceScreenState();
}

class _AddResourceScreenState extends State<AddResourceScreen> {
  String? selectedCourse;
  String selectedType = 'past_year';
  String title = '';
  String? videoUrl;
  File? selectedFile;

  Future<void> _pickFile() async {
    final params = const OpenFileDialogParams(
      fileExtensionsFilter: ['pdf'],
    );
    final filePath = await FlutterFileDialog.pickFile(params: params);
    if (filePath != null) {
      setState(() {
        selectedFile = File(filePath);
      });
    }
  }

  void _addResource() {
    if (selectedCourse != null &&
        title.isNotEmpty &&
        (selectedType == 'video' ? videoUrl != null : selectedFile != null)) {
      Resource newResource = Resource(
        title: title,
        pdfUrl: selectedType == 'video' ? videoUrl! : selectedFile!.path,
        type: selectedType,
        icon: selectedType == 'video'
            ? Icons.play_circle_fill
            : Icons.picture_as_pdf,
      );

      widget.onResourceAdded(selectedCourse!, newResource);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete all fields.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Resource"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              "Select Course",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: selectedCourse,
              hint: const Text("Select Course"),
              isExpanded: true,
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
              decoration: const InputDecoration(
                labelText: "Title",
                prefixIcon: Icon(Icons.title),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  title = value;
                });
              },
            ),
            const SizedBox(height: 8),
            const Text(
              "Please provide a brief title for the resource you are adding.",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Text(
              "Select Resource Type",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: selectedType,
              isExpanded: true,
              onChanged: (value) {
                setState(() {
                  selectedType = value!;
                  videoUrl = null; // Reset video URL when changing type
                  selectedFile = null; // Reset selected file when changing type
                });
              },
              items: <String>['past_year', 'notes', 'video'].map((String type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type[0].toUpperCase() +
                      type.substring(1)), // Capitalize first letter
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            if (selectedType == 'video') ...[
              TextField(
                decoration: const InputDecoration(
                  labelText: "Video URL",
                  prefixIcon: Icon(Icons.video_library),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    videoUrl = value;
                  });
                },
              ),
            ] else ...[
              ElevatedButton.icon(
                onPressed: _pickFile,
                icon: const Icon(Icons.upload_file),
                label: const Text("Upload PDF"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
              if (selectedFile != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                      "Selected File: ${selectedFile!.path.split('/').last}"),
                ),
            ],
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _addResource,
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: const Text("Add Resource"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
