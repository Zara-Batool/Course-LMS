import 'package:flutter/material.dart';
import 'package:lms/Widgets/course_container.dart';

class CompletedCourses extends StatelessWidget {
  const CompletedCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: [
          CourseContainer(
            title: 'Flutter Mobile Apps',
            imagePath: 'assets/C2.jpg',
            lessonsToGo: '0',
            progress: 100,
            time: 5,
            video: 'assets/V1.mp4',
          ),
          CourseContainer(
            title: 'Python Programming',
            imagePath: 'assets/C3.jpg',
            lessonsToGo: '0',
            progress: 100,
            time: 5,
            video: 'assets/V1.mp4',
          ),
        ],
      ),
    );
  }
}
