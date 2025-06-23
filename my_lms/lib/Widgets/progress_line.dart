import 'package:flutter/material.dart';

class ProgressLine extends StatelessWidget {
  final double percentage;

  const ProgressLine({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    Color progressColor = _getColorForPercentage(percentage);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 5.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Colors.grey.shade300,
          ),
          child: LinearProgressIndicator(
            value: percentage / 100,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation<Color>(progressColor),
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "${percentage.toStringAsFixed(0)}%",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: progressColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Determine color based on percentage
  Color _getColorForPercentage(double percentage) {
    if (percentage < 50) {
      return Colors.red;
    } else if (percentage < 75) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }
}
