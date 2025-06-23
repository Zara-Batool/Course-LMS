import 'package:flutter/material.dart';

class InstructorSection extends StatelessWidget {
  const InstructorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: 2.0), // Further reduced padding
          child: Text(
            'Instructor',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        InstructorItem(
          name: 'Leslie Alexander',
          role: 'Faculty, Program In UI UX Design',
          imageUrl: 'assets/instructor1.jpeg',
        ),
        InstructorItem(
          name: 'Jacob Jones',
          role: 'Faculty, Program In UI UX Design',
          imageUrl: 'assets/instructor2.jpeg',
        ),
      ],
    );
  }
}

class InstructorItem extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;
  final Color backgroundColor;
  const InstructorItem({
    super.key,
    required this.name,
    required this.role,
    required this.imageUrl,
    this.backgroundColor =
        Colors.white, // Default to white if no color is provided
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), // Rounded corners
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 230, 228, 228),
              spreadRadius: 3,
              blurRadius: 12,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero, // Remove default padding
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(20.0), // Rounded image
            child: Image.asset(
              imageUrl,
              width: 50, // Set image width
              height: 50, // Set image height
              fit: BoxFit.cover, // Fit image
            ),
          ),
          title: Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black, // Set text color for name
            ),
          ),
          subtitle: Text(
            role,
            style: const TextStyle(
              color: Colors.grey, // Set text color for role
            ),
          ),
        ),
      ),
    );
  }
}
