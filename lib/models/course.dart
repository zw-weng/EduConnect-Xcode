class Course {
  final String name;
  final String iconPath;
  final List<Resource> resources;

  Course({
    required this.name,
    required this.iconPath,
    required this.resources,
  });
}

class Resource {
  final String title;
  final String url;
  final bool isVideo;

  Resource({required this.title, required this.url, this.isVideo = false});
}