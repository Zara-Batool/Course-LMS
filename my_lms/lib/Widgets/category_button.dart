import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryButton({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          child:
              Icon(icon, size: 24), // Added size to the icon for better scaling
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
