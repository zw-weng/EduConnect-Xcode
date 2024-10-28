import 'session.dart';

class Tutor {
  final String name;
  final String subject;
  final double rating;
  final String description;
  final String imageUrl;
  final String course;
  final List<Session> availableSessions;

  Tutor({
    required this.name,
    required this.subject,
    required this.rating,
    required this.description,
    required this.imageUrl,
    required this.course,
    this.availableSessions  = const [], 
  });
}