import 'package:flutter/material.dart';
import 'package:lms/Widgets/course_info_item.dart';

class CourseInfoSection extends StatelessWidget {
  const CourseInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CourseInfoItem(label: '12 Lessons', icon: Icons.book),
            SizedBox(width: 6),
            CourseInfoItem(label: 'Beginner', icon: Icons.star),
            SizedBox(width: 6),
            CourseInfoItem(label: '6 Weeks', icon: Icons.calendar_month),
          ],
        ),
        SizedBox(height: 14.0), // Space between rows
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CourseInfoItem(label: 'English', icon: Icons.language),
            SizedBox(width: 6),
            CourseInfoItem(label: 'Certificate', icon: Icons.verified),
            SizedBox(width: 6),
            CourseInfoItem(label: 'Fully Secure', icon: Icons.lock),
          ],
        ),
      ],
    );
  }
}
