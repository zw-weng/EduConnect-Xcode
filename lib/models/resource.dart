import 'package:flutter/material.dart';

class Resource {
  final String title;
  final String pdfUrl;
  final String type; // Type of the resource
  final IconData icon; // Add an icon property

  Resource({
    required this.title,
    required this.pdfUrl,
    required this.type,
    required this.icon, // Initialize the icon in the constructor
  });
}