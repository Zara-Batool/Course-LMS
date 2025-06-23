import 'package:flutter/material.dart';
import 'package:lms/Screens/Courses/completed_courses.dart';
import 'package:lms/Screens/Courses/ongoing_courses.dart';
import 'package:lms/Widgets/course_tab_bar.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({super.key});

  @override
  _MyCoursesState createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Courses',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CourseTabBar(tabController: tabController),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                OngoingCourses(),
                CompletedCourses(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
