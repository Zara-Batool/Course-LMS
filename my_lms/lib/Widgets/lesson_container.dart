import 'package:flutter/material.dart';

class LessonContainer extends StatefulWidget {
  final String title;
  final String lessonNumber;
  final String imagePath;
  final String content;

  const LessonContainer({
    super.key,
    required this.title,
    required this.lessonNumber,
    required this.imagePath,
    required this.content,
  });

  @override
  _LessonContainerState createState() => _LessonContainerState();
}

class _LessonContainerState extends State<LessonContainer> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 12,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(15.0), // Adjust the radius as needed
                child: Image.asset(
                  widget.imagePath,
                  width: 50,
                  height: 50,
                  fit: BoxFit
                      .cover, // This ensures the image covers the entire rounded area
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4.0,
                        horizontal: 8.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue.shade50,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        widget.lessonNumber,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ],
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(widget.content),
            ),
        ],
      ),
    );
  }
}
