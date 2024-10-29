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

  // Data for onboarding screens
  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/online_learning.png",
      "title": "Online Learning",
      "description": "We Provide Online Classes and Pre-recorded Lectures.!"
    },
    {
      "image": "assets/images/learn_anytime.png",
      "title": "Learn from Anytime",
      "description": "Booked or save the lectures for future reference."
    },
    {
      "image": "assets/images/online_certificate.png",
      "title": "Get Online Certificate",
      "description": "Analyse your scores and track your results."
    },
  ];

  // Skip action - Navigate to Login page
  void _skipToLogin() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  // Go to the next page or skip to login if on the last page
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
      backgroundColor: const Color(0xFFF5F7FA), // Light background color
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button at the top-right
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
                      color: Color(0xFF1F2C37),
                    ),
                  ),
                ),
              ),
            ),

            // PageView for the onboarding screens
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

            // Dots Indicator and Next/Get Started Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Dots Indicator
                  DotsIndicator(
                    currentPage: _currentPage,
                    itemCount: _onboardingData.length,
                  ),

                  // Next or Get Started Button
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
