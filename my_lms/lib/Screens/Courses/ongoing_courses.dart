import 'package:flutter/material.dart';
import 'package:lms/Widgets/course_container.dart';

class OngoingCourses extends StatelessWidget {
  const OngoingCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: [
          CourseContainer(
            title: 'UI/UX Design',
            imagePath: 'assets/C1.jpg',
            lessonsToGo: '8',
            progress: 20,
            video: 'assets/V1.mp4',
            time: 10,
          ),
          CourseContainer(
            title: 'Flutter Mobile Apps',
            imagePath: 'assets/C2.jpg',
            lessonsToGo: '1',
            progress: 80,
            time: 5,
            video: 'assets/V1.mp4',
          ),
          CourseContainer(
            title: 'Python Programming',
            imagePath: 'assets/C3.jpg',
            lessonsToGo: '4',
            progress: 90,
            video: 'assets/V1.mp4',
            time: 5,
          ),
          CourseContainer(
            title: 'Graphic Designing',
            imagePath: 'assets/C4.jpg',
            lessonsToGo: '3',
            progress: 10,
            video: 'assets/V1.mp4',
            time: 7,
          ),
        ],
      ),
    );
  }
}
