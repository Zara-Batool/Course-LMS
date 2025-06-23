import 'package:flutter/material.dart';
import 'package:lms/Widgets/lesson_container.dart';

class LessonsTab extends StatelessWidget {
  const LessonsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          LessonContainer(
            title: 'Introduction',
            lessonNumber: 'Lesson 1',
            imagePath: 'assets/C1.jpg',
            content: '',
          ),
          LessonContainer(
            title: 'User Research',
            lessonNumber: 'Lesson 2',
            imagePath: 'assets/C1.jpg',
            content: '',
          ),
          LessonContainer(
            title: 'Wireframing',
            lessonNumber: 'Lesson 3',
            imagePath: 'assets/C1.jpg',
            content: '',
          ),
          LessonContainer(
            title: 'Types of UI design',
            lessonNumber: 'Lesson 4',
            imagePath: 'assets/C1.jpg',
            content: '',
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
