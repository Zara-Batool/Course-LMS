import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  final VoidCallback onClose;

  const FeedbackPage({required this.onClose, super.key});

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  int _selectedStars = 0; 

  // Function to build stars
  Widget _buildStar(int index) {
    return IconButton(
      icon: Icon(
        index <= _selectedStars
            ? Icons.star
            : Icons.star_border, 
        color: Colors.amber,
        size: 40,
      ),
      onPressed: () {
        setState(() {
          _selectedStars = index; 
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54, 
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20.0), 
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Give your opinion',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'How would you rate your experience?',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) => _buildStar(index + 1)),
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            color: Color.fromARGB(255, 9, 63, 107)),
                        backgroundColor: Colors.white,
                        foregroundColor: const Color.fromARGB(255, 9, 63, 107),
                      ),
                      onPressed: widget.onClose,
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            color: Color.fromARGB(255, 9, 63, 107)),
                        backgroundColor: const Color.fromARGB(255, 9, 63, 107),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        widget.onClose();
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
