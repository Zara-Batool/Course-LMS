import 'package:flutter/material.dart';
import 'package:lms/Widgets/course_details.dart';

class CourseCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double rating;
  final String duration;
  final String instructor;
  final String instructorImage;
  final double price;

  const CourseCard({
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
        shadowColor: Colors.grey,
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
