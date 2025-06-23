import 'package:flutter/material.dart';
import 'package:lms/Widgets/category_button.dart';
import 'package:lms/Widgets/course_card.dart';
import 'package:lms/Widgets/mini_course_card.dart';
import 'package:lms/Widgets/promo_carousel.dart';
import 'package:lms/Widgets/search_bar.dart';
import 'package:lms/Widgets/user_greeting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> trendingCourses = [
    {
      'imagePath': 'assets/UI.jpeg',
      'title': 'UI/UX ',
      'rating': 4.9,
      'duration': '2.4 hrs',
      'instructor': 'Michael Johnson',
      'price': 129.0,
      'instructorImagePath': 'assets/instructor1.jpeg',
    },
    {
      'imagePath': 'assets/Course2.jpeg',
      'title': 'Office management master class',
      'rating': 4.5,
      'duration': '2.5 hrs',
      'instructor': 'Emily Davis',
      'price': 159.0,
      'instructorImagePath': 'assets/instructor2.jpeg',
    },
    {
      'imagePath': 'assets/C3.jpg',
      'title': 'Digital photography master class',
      'rating': 4.4,
      'duration': '3.2 hrs',
      'instructor': 'Chris Lee',
      'price': 199.0,
      'instructorImagePath': 'assets/instructor3.jpeg',
    },
  ];

  final List<Map<String, dynamic>> recentlyAddedCourses = [
    {
      'imagePath': 'assets/C6.jpeg',
      'title': 'Creative photo with Photoshop',
      'rating': 4.9,
      'duration': '2.4 hrs',
      'instructor': 'Michael Johnson',
      'price': 129.0,
      'instructorImagePath': 'assets/instructor1.jpeg',
    },
    {
      'imagePath': 'assets/Course2.jpeg',
      'title': 'Illustration for beginners',
      'rating': 4.5,
      'duration': '2.5 hrs',
      'instructor': 'Emily Davis',
      'price': 159.0,
      'instructorImagePath': 'assets/instructor2.jpeg',
    },
    {
      'imagePath': 'assets/C4.jpg',
      'title': 'Advanced graphic design',
      'rating': 4.4,
      'duration': '3.2 hrs',
      'instructor': 'Chris Lee',
      'price': 199.0,
      'instructorImagePath': 'assets/instructor3.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UserGreeting(),
                const MySearchBar(),
                const PromoCarousel(),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryButton(
                        icon: Icons.design_services, label: 'Design'),
                    CategoryButton(icon: Icons.code, label: 'Code'),
                    CategoryButton(
                        icon: Icons.business_center, label: 'Business'),
                    CategoryButton(
                        icon: Icons.camera_alt, label: 'Photography'),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Trending Courses',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildMiniCourseList(trendingCourses),
                const Text(
                  'Recently Added',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildCourseList(recentlyAddedCourses),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCourseList(List<Map<String, dynamic>> courses) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CourseCard(
              imagePath: course['imagePath'],
              title: course['title'],
              rating: course['rating'],
              duration: course['duration'],
              instructor: course['instructor'],
              price: course['price'],
              instructorImage: course['instructorImagePath'],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMiniCourseList(List<Map<String, dynamic>> courses) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: MiniCourseCard(
              imagePath: course['imagePath'],
              title: course['title'],
              rating: course['rating'],
              duration: course['duration'],
              instructor: course['instructor'],
              price: course['price'],
              instructorImage: course['instructorImagePath'],
            ),
          );
        },
      ),
    );
  }
}
