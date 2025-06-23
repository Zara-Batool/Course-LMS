import 'package:flutter/material.dart';
import 'package:lms/Widgets/skills_chip.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Skills You Will Learn:',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Wrap(
          spacing: 8.0,
          children: [
            SkillChip(label: 'UI Design'),
            SkillChip(label: 'UX Design'),
            SkillChip(label: 'Prototyping'),
            SkillChip(label: 'Wireframing'),
          ],
        ),
      ],
    );
  }
}
