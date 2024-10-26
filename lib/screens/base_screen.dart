import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:educonnect/constants/colors.dart';
import 'package:educonnect/screens/home_screen.dart';
import 'package:educonnect/screens/profile_screen.dart';
import 'package:educonnect/screens/resources_screen.dart';
import 'package:educonnect/screens/tuition_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ResourcesScreen(),
    TuitionScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: GNav(
          gap: 8,
          activeColor: Colors.white,
          color: Colors.grey.shade600,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          tabBackgroundColor: kPrimaryColor.withOpacity(0.8),
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.library_books,
              text: 'Resources',
            ),
            GButton(
              icon: Icons.school,
              text: 'Tuition',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
