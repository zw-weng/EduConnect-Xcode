import 'package:educonnect/models/course.dart';

final List<Course> courses = [
  Course(
    name: "Add Maths",
    iconPath: "assets/icons/addmath.png",
    resources: [
      Resource(title: "2021 NS MPSM K1 Question", url: "assets/pdfs/2021 Negeri_Sembilan_MPSM Add_Maths K1.pdf"),
      Resource(title: "2021 NS MPSM K1 Answer", url: "assets/pdfs/2021 Negeri_Sembilan_MPSM Add_Maths K1 Jawapan.pdf"),
      Resource(title: "Intro to Calculus", url: "https://youtu.be/YNstP0ESndU?si=SXFBwuHGCRMpeKSy", isVideo: true),
    ],
  ),
  Course(
    name: "Biology",
    iconPath: "assets/icons/bio.png",
    resources: [
      Resource(title: "Chapter 1 - Cells", url: "assets/pdfs/bio1.pdf"),
      Resource(title: "DNA Structure", url: "", isVideo: true),
    ],
  ),
  // Add more courses as needed
];
