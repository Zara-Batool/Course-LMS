import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Privacy Policy',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0), // Padding around the content
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the start
          children: [
            SizedBox(height: 9), // Spacer after AppBar
            Text(
              '1- Data Collection',
              style: TextStyle(
                fontSize: 18, // Font size for heading
                fontWeight: FontWeight.bold, // Bold text
              ),
            ),
            SizedBox(height: 5), // Spacer between heading and answer
            Text(
              'We collect your personal data to provide better services. Your information will not be shared with third parties without consent.',
              style: TextStyle(
                fontSize: 13, // Font size for answer

                fontWeight: FontWeight.normal, // Regular text
              ),
            ),

            SizedBox(height: 5), // Spacer after first section

            Text(
              '2- Disclosure of your data',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5), // Spacer between heading and answer

            Text(
              'The data we collect is used to improve user experience and provide tailored services. We take the utmost care in handling your data securely.',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              '3- Use of your personal data',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5), // Spacer between heading and answer

            Text(
              'The data we collect is used to improve user experience and provide tailored services. We take the utmost care in handling your data securely.',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
