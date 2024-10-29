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
  String? selectedType;
  String title = '';
  String? videoUrl;
  File? selectedFile;

  Future<void> _pickFile() async {
    const params = OpenFileDialogParams(
      fileExtensionsFilter: ['pdf'],
    );
    final filePath = await FlutterFileDialog.pickFile(params: params);
    if (filePath != null) {
      setState(() {
        selectedFile = File(filePath);
      });
    }
  }

  Future<void> _addResource() async {
    if (selectedCourse != null &&
        title.isNotEmpty &&
        (selectedType == 'video' ? videoUrl != null : selectedFile != null)) {
      String resourcePath;

      // If selected type is 'video', use the video URL directly; otherwise, use the selected file path
      if (selectedType == 'video') {
        resourcePath = videoUrl!;
      } else {
        resourcePath = selectedFile!.path; // Directly use the file path
      }

      Resource newResource = Resource(
        title: title,
        pdfUrl: resourcePath,
        type: selectedType!,
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
      backgroundColor: const Color(0xFFF5F9FF),
      appBar: AppBar(
        title: Text(
          "Add Resource",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
              ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.5],
              colors: [
                Color(0xFF886FF2), // kPrimaryLight
                Color(0xFF6849EF), // kPrimaryColor
              ],
            ),
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildLabel("Select Course"),
            const SizedBox(height: 8),
            _buildDropdownField<String>(
              hint: "Select Course",
              value: selectedCourse,
              items: widget.courses.map((course) {
                return DropdownMenuItem(
                  value: course.name,
                  child: Text(course.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCourse = value;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildInputField(
              label: "Title",
              hintText: "Enter resource title",
              icon: Icons.title,
              onChanged: (value) {
                setState(() {
                  title = value;
                });
              },
            ),
            const SizedBox(height: 8),
            const Text(
              "Please provide a brief title for the resource you are adding.",
              style: TextStyle(color: Colors.blueGrey, fontSize: 14),
            ),
            const SizedBox(height: 20),
            _buildLabel("Select Resource Type"),
            const SizedBox(height: 8),
            _buildDropdownField<String>(
              hint: "Select Resource Type",
              value: selectedType,
              items: <String>['past_year', 'notes', 'video'].map((String type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type[0].toUpperCase() + type.substring(1)),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedType = value!;
                  videoUrl = null;
                  selectedFile = null;
                });
              },
            ),
            const SizedBox(height: 20),
            if (selectedType == 'video') ...[
              _buildInputField(
                label: "Video URL",
                hintText: "Paste video URL",
                icon: Icons.video_library,
                onChanged: (value) {
                  setState(() {
                    videoUrl = value;
                  });
                },
              ),
            ] else ...[
              _buildFileUploadButton(),
            ],
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _addResource,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF6849EF), // Primary color
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Add Resource"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
    );
  }

  Widget _buildDropdownField<T>({
    T? value,
    required String hint,
    required List<DropdownMenuItem<T>> items,
    required ValueChanged<T?> onChanged,
  }) {
    return DropdownButtonFormField<T>(
      value: value,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFE7ECF3), // Updated to new light gray color
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      hint: Text(hint),
      isExpanded: true,
      onChanged: onChanged,
      items: items,
    );
  }

  Widget _buildInputField({
    required String label,
    required String hintText,
    required IconData icon,
    required ValueChanged<String> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label),
        const SizedBox(height: 8),
        TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon, color: const Color(0xFF6849EF)),
            filled: true,
            fillColor: const Color(0xFFE7ECF3), // Updated to new light gray color
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFF6849EF)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFileUploadButton() {
    return ElevatedButton.icon(
      onPressed: _pickFile,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      icon: const Icon(Icons.upload_file),
      label: const Text("Upload PDF"),
    );
  }
}
 