import 'package:educonnect/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:educonnect/widgets/onboarding_content.dart';
import 'package:educonnect/widgets/dots_indicator.dart';
import 'package:educonnect/widgets/next_button.dart';
import 'package:educonnect/widgets/get_started_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/Main img.png",
      "title": "Online Tutoring",
      "description":
          "We provide online tuition and allow you to book sessions with expert tutors."
    },
    {
      "image": "assets/images/Main img 1.png",
      "title": "Learn Anytime",
      "description":
          "Download resources and access them offline, ensuring you can learn anytime, anywhere."
    },
    {
      "image": "assets/images/Main img 2.png",
      "title": "Share Resources",
      "description":
          "Upload and share your own resources with others, fostering a collaborative learning environment."
    }
  ];

  void _skipToLogin() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  void _goToNextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      _skipToLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: _skipToLogin,
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingContent(
                    image: _onboardingData[index]["image"] ?? "",
                    title: _onboardingData[index]["title"] ?? "",
                    description: _onboardingData[index]["description"] ?? "",
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: DotsIndicator(
                      currentPage: _currentPage,
                      itemCount: _onboardingData.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: _currentPage == _onboardingData.length - 1
                        ? GetStartedButton(onPressed: _skipToLogin)
                        : NextButton(onPressed: _goToNextPage),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
