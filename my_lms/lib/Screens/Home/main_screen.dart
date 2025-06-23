import 'package:flutter/material.dart';
import 'package:lms/Screens/Courses/courses.dart';
import 'package:lms/Screens/Home/home_screen.dart';
import 'package:lms/Screens/Chat/my_chat.dart';
import 'package:lms/Screens/Profile/my_profile.dart';
import 'package:lms/Widgets/custom_bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const MyCourses(),
    const MyChat(),
    const MyProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool> _handleBackButton() async {
    if (_selectedIndex != 0) {
      setState(() {
        _selectedIndex = 0; // Navigate back to the Home tab
      });
      return Future.value(false); // Prevent default back navigation
    }
    return Future.value(true); // Allow back navigation if already on Home tab
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: _handleBackButton,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
