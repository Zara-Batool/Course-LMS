import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          faqContainer(
            question: 'What is Flutter?',
            answer:
                'Flutter is an open-source UI toolkit created by Google for building cross-platform apps.',
          ),
          faqContainer(
            question: 'How do I install Flutter?',
            answer:
                'You can install Flutter from the official website: flutter.dev.',
          ),
          faqContainer(
            question: 'Is Flutter free to use?',
            answer: 'Yes, Flutter is completely free and open-source.',
          ),
          faqContainer(
            question: 'Can I use Flutter for web development?',
            answer:
                'Yes, Flutter supports web development along with mobile and desktop applications.',
          ),
          faqContainer(
            question: 'How do I get started with Flutter?',
            answer:
                'You can start by reading the official documentation and tutorials on flutter.dev.',
          ),
        ],
      ),
    );
  }

  // A reusable widget for FAQ items
  Widget faqContainer({required String question, required String answer}) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        backgroundColor: Colors.white,
        title: Text(
          question,
          style: const TextStyle(
            fontSize: 18, // Increased font size for better readability
            fontWeight: FontWeight.w600, // Slightly bold for better emphasis
            color: Color.fromARGB(
                255, 11, 69, 116), // Adjusted color for better contrast
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              answer,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
