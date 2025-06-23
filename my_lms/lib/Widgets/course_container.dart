import 'package:flutter/material.dart';
import 'package:lms/Widgets/course_page.dart';
import 'package:lms/Widgets/progress_line.dart';

class CourseContainer extends StatefulWidget {
  final String title;
  final String video;
  final String imagePath;
  final String lessonsToGo;
  final double progress;
  final int time;

  const CourseContainer({
    super.key,
    required this.title,
    required this.imagePath,
    required this.lessonsToGo,
    required this.progress,
    required this.video,
    required this.time,
  });

  @override
  CourseContainerState createState() => CourseContainerState();
}

class CourseContainerState extends State<CourseContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CoursePage(
              courseTitle: widget.title,
              time: widget.time,
              video: 'assets/V1.mp4',
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 230, 228, 228),
              spreadRadius: 3,
              blurRadius: 12,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                widget.imagePath,
                width: 50,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${widget.lessonsToGo} lessons to go",
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  ProgressLine(percentage: widget.progress),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
