import 'package:educonnect/constants/colors.dart';
import 'package:educonnect/models/resource.dart';
import 'package:educonnect/models/session.dart';
import 'package:educonnect/widgets/resource_card.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:educonnect/widgets/search_field.dart';
import 'package:educonnect/widgets/tutor_card.dart';
import 'package:educonnect/models/tutor.dart';
import 'package:educonnect/screens/pdf_preview_screen.dart';
import 'package:educonnect/screens/video_preview_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Tutor> tutors = [
    Tutor(
      name: "Jotaro",
      rating: 4.8,
      imageUrl: 'assets/images/jotaro.png',
      course: 'Physics',
      subject: 'Science',
      description: 'Experienced Physics tutor',
      availableSessions: [
        Session(
          tutorName: 'Grace Green',
          subject: 'English',
          date: '2023-10-08',
          startTime: '08:00 PM',
          endTime: '09:00 PM',
        ),
      ],
    ),
    Tutor(
      name: "Siti Norleha",
      rating: 5.0,
      imageUrl: 'assets/images/siti.jpg',
      course: 'Add Math',
      subject: 'Mathematics',
      description: 'Expert in Additional Mathematics',
      availableSessions: [
        Session(
          tutorName: 'Henry Hill',
          subject: 'Art',
          date: '2023-10-09',
          startTime: '09:00 PM',
          endTime: '10:00 PM',
        ),
      ],
    ),
    Tutor(
      name: "Suzana Li",
      rating: 4.8,
      imageUrl: 'assets/images/suzana.jpg',
      course: 'Biology',
      subject: 'Science',
      description: 'Professional Coding instructor',
      availableSessions: [
        Session(
          tutorName: 'Edward Frank',
          subject: 'Geography',
          date: '2023-10-07',
          startTime: '07:00 PM',
          endTime: '08:00 PM',
        ),
      ],
    ),
  ];

  final List<Resource> topResources = [
    Resource(
      title: "2021 Negeri Sembilan MPSM Add Maths K1",
      type: "past_year",
      pdfUrl: "assets/pdfs/2021 Negeri_Sembilan_MPSM Add_Maths K1.pdf",
      icon: Icons.assignment_rounded,
    ),
    Resource(
      title: "Energy Changes in Chemical Reactions",
      type: "notes",
      pdfUrl: "assets/pdfs/Energy Changes in Chemical Reactions.pdf",
      icon: Icons.sticky_note_2_rounded,
    ),
    Resource(
      title: "Web Development Full Course by FreeCodeCamp",
      type: "video",
      pdfUrl: "https://youtu.be/nu_pCVPKzTk?si=mSPwNViTEKi0qHYM",
      icon: Icons.video_library_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Container(
          color: kBackColor, // Set the background color
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text(
                  "Recommended Tutors",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: kTextColor,
                      ),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 160,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                ),
                items: tutors.map((tutor) {
                  return TutorCard(tutor: tutor);
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text(
                  "Top Resources This Month",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: kTextColor,
                      ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  itemCount: topResources.length,
                  itemBuilder: (context, index) {
                    final resource = topResources[index];

                    return GestureDetector(
                      onTap: () {
                        if (resource.type == 'video') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoPreviewScreen(videoUrl: resource.pdfUrl),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PdfPreviewScreen(pdfUrl: resource.pdfUrl),
                            ),
                          );
                        }
                      },
                      child: ResourceCard(
                        resource: resource,
                        installs: '1000+',
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 220,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5],
          colors: [
            kPrimaryLight,
            kPrimaryColor,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello,\nGood Day",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Welcome back to EduConnect!",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/malaysia-flag-1.jpg'),
                radius: 25,
              ),
            ],
          ),
          const SizedBox(height: 10), // Increased space below search bar
          const SearchField(),
          const SizedBox(height: 10), // Additional spacing for better layout
        ],
      ),
    );
  }
}
