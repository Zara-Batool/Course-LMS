import 'package:flutter/material.dart';
import 'package:lms/Widgets/course_info.dart';
import 'package:lms/Widgets/custom_tab_bar.dart';
import 'package:lms/Widgets/instructor.dart';
import 'package:lms/Widgets/lesson_tab.dart';
import 'package:lms/Widgets/skills.dart';
import 'package:lms/Widgets/video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:lms/Widgets/reviews_tab.dart';

class CourseDetailPage extends StatefulWidget {
  final String videoPath;
  final String title;
  final double rating;
  final String duration;
  final String instructor;
  final String instructorImage;
  final double price;

  const CourseDetailPage({
    super.key,
    required this.videoPath,
    required this.title,
    required this.rating,
    required this.duration,
    required this.instructor,
    required this.instructorImage,
    required this.price,
    required String imagePath,
  });

  @override
  _CourseDetailPageState createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath);
    _initializeVideoPlayerFuture = _controller.initialize();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Course'),
      ),
      body: Stack(
        children: [
          // Scrollable content
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.25 + 56.0),
            child: TabBarView(
              controller: _tabController,
              children: [
                // Overview Tab
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                        'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 16),
                      // Course Info Section
                      const CourseInfoSection(),
                      const SizedBox(height: 8),
                      // Instructor Section
                      const InstructorSection(),
                      const SizedBox(height: 8),
                      // Skill & Enroll Section
                      const SkillSection(),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
                const LessonsTab(),
                const ReviewsTab(),
              ],
            ),
          ),
          // Fixed video player and tabs
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.25,
                  width: double.infinity,
                  child: FutureBuilder<void>(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return VideoPlayerContainerBox(controller: _controller);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                CustomTabBar(tabController: _tabController),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 45.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 12, 83, 138),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 12, 83, 138),
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              backgroundColor:
                  const Color.fromARGB(255, 12, 83, 138), // Text Color
            ),
            child: const Text(
              'Enroll Now!',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
