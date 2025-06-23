import 'package:flutter/material.dart';
import 'package:lms/Widgets/course_details.dart';

class MiniCourseCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double rating;
  final String duration;
  final String instructor;
  final String instructorImage;
  final double price;

  const MiniCourseCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.duration,
    required this.instructor,
    required this.instructorImage,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseDetailPage(
              imagePath: imagePath,
              title: title,
              rating: rating,
              duration: duration,
              instructor: instructor,
              instructorImage: instructorImage,
              price: price,
              videoPath: 'assets/V1.mp4',
            ),
          ),
        );
      },
      child: SizedBox(
        width: 80, // Fixed width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 75,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 2),
                  // Title
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
