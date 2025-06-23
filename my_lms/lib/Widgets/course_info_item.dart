import 'package:flutter/material.dart';

class CourseInfoItem extends StatelessWidget {
  final String label;
  final IconData icon;

  const CourseInfoItem({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70, // Box width
      height: 70, // Box height
      padding: const EdgeInsets.all(8.0), // Padding within the container
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Distribute space between children
        crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
        children: [
          Icon(icon, size: 40, color: Colors.blue), // Icon size
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 9.0,
            ),
          ),
        ],
      ),
    );
  }
}
