import 'package:flutter/material.dart';
import 'package:lms/Widgets/video_player_container.dart';

class CoursePage extends StatelessWidget {
  final String courseTitle;
  final int time;
  final String video;

  const CoursePage(
      {super.key,
      required this.courseTitle,
      required this.time,
      required this.video});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Lesson 1 - Introduction",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 4),
                    backgroundColor: const Color.fromARGB(255, 167, 211, 247),
                  ),
                  child: const Text(
                    "30 mins",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const VideoPlayerContainer(
              title: "Lorem Ipsum",
              video: '',
              time: 2,
              box: 01,
            ),
            const SizedBox(height: 5),
            const VideoPlayerContainer(
              title: "Lorem Ipsum",
              video: '',
              time: 3,
              box: 02,
            ),
            const SizedBox(height: 5),
            const VideoPlayerContainer(
              title: "Lorem Ipsum",
              video: '',
              time: 15,
              box: 03,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Lesson 2 - User Research",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 4),
                    backgroundColor: const Color.fromARGB(255, 167, 211, 247),
                  ),
                  child: const Text(
                    "30 mins",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const VideoPlayerContainer(
              title: "Lorem Ipsum",
              video: '',
              time: 2,
              box: 04,
            ),
            const SizedBox(height: 5),
            const VideoPlayerContainer(
              title: "Lorem Ipsum",
              video: '',
              time: 3,
              box: 05,
            ),
            const SizedBox(height: 5),
            const VideoPlayerContainer(
              title: "Lorem Ipsum",
              video: '',
              time: 15,
              box: 06,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60.0,
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
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                  vertical: 20.0), // Increased padding for better touch
              backgroundColor: const Color.fromARGB(255, 12, 83, 138),
            ),
            child: const Text(
              'Continue Course',
              style: TextStyle(
                fontSize: 16, // Increased font size for better readability
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
