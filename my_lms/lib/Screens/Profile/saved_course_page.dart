import 'package:flutter/material.dart';
import 'package:lms/Widgets/course_details.dart'; // Adjust based on your import structure

class SavedCoursePage extends StatelessWidget {
  final List<Course> courses = [
    Course(
      imagePath: 'assets/C1.jpg',
      title: 'UI/UX Design Master Class',
      rating: 4.9,
      duration: '2.40 Hrs',
      instructor: 'Jenny Wilson',
      instructorImage: 'assets/instructor1.jpeg',
      price: 29.99,
    ),
    Course(
      imagePath: 'assets/C2.jpg',
      title: 'Office Management Master Class',
      rating: 4.9,
      duration: '2.40 Hrs',
      instructor: 'Cody Fisher',
      instructorImage: 'assets/instructor2.jpeg',
      price: 29.99,
    ),
    Course(
      imagePath: 'assets/C3.jpg',
      title: 'Introduction to Programming',
      rating: 4.7,
      duration: '3.00 Hrs',
      instructor: 'Alice Smith',
      instructorImage: 'assets/instructor4.jpeg',
      price: 35.00,
    ),
    Course(
      imagePath: 'assets/C4.jpg',
      title: 'Digital Marketing Bootcamp',
      rating: 4.8,
      duration: '4.50 Hrs',
      instructor: 'Michael Johnson',
      instructorImage: 'assets/instructor5.jpeg',
      price: 49.99,
    ),
    Course(
      imagePath: 'assets/C5.jpg',
      title: 'Advanced Graphic Design',
      rating: 4.6,
      duration: '2.00 Hrs',
      instructor: 'Ella Brown',
      instructorImage: 'assets/instructor4.jpeg',
      price: 39.99,
    ),
    Course(
      imagePath: 'assets/C6.jpeg',
      title: 'Data Science from Scratch',
      rating: 4.95,
      duration: '5.00 Hrs',
      instructor: 'Liam Davis',
      instructorImage: 'assets/instructor5.jpeg',
      price: 59.99,
    ),
  ];
  SavedCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Saved Courses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 8.0, // Adjust horizontal spacing
            mainAxisSpacing: 8.0, // Adjust vertical spacing
            childAspectRatio: 0.6, // Adjust as needed for small cards
          ),
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return SmallCourseCard(
              imagePath: course.imagePath,
              title: course.title,
              rating: course.rating,
              duration: course.duration,
              instructor: course.instructor,
              instructorImage: course.instructorImage,
              price: course.price,
            );
          },
        ),
      ),
    );
  }
}

class Course {
  final String imagePath;
  final String title;
  final double rating;
  final String duration;
  final String instructor;
  final String instructorImage;
  final double price;

  Course({
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.duration,
    required this.instructor,
    required this.instructorImage,
    required this.price,
  });
}

class SmallCourseCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double rating;
  final String duration;
  final String instructor;
  final String instructorImage;
  final double price;

  const SmallCourseCard({
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
      child: Card(
        color: Colors.white,
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          width: 150, // Fixed width for the card
          height: 200, // Fixed height for the card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 140, // Increased image height
                  width: double.infinity,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row for Rating and Duration with added vertical spacing
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0), // Added vertical padding
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Rating Box
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 252, 249, 225),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.yellow, size: 12),
                                const SizedBox(width: 2),
                                Text(
                                  rating.toString(),
                                  style: const TextStyle(
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Duration
                          Row(
                            children: [
                              const Icon(Icons.access_time, size: 10),
                              const SizedBox(width: 2),
                              Text(
                                duration,
                                style: const TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                        height:
                            10), // Increased spacing between Rating and Title
                    // Title
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                        height:
                            10), // Spacing between Title and Instructor Info
                    Row(
                      children: [
                        // Instructor Avatar
                        CircleAvatar(
                          backgroundImage: AssetImage(instructorImage),
                          radius: 10, // Smaller avatar size
                        ),
                        const SizedBox(width: 4),
                        // Instructor Name
                        Expanded(
                          child: Text(
                            instructor,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Color.fromARGB(255, 12, 61, 100),
                            ),
                            maxLines: 1,
                          ),
                        ),
                        const SizedBox(width: 4),
                        // Price Box
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 1),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '\$$price',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 4, 69, 122),
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
