import 'package:flutter/material.dart';
import 'package:lms/Screens/LogIn/log_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                'Create an account',
                style: TextStyle(
                  fontSize: 24, // Fixed font size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField('Name'),
            const SizedBox(height: 10), // Reduced spacing
            _buildTextField('Email'),
            const SizedBox(height: 10), // Reduced spacing
            _buildTextField('Password', obscureText: true),
            const SizedBox(height: 10), // Reduced spacing
            _buildTextField('Confirm password', obscureText: true),
            const SizedBox(height: 20), // Add space after the last TextField
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
                const Text('I agree with '),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Terms and condition',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50, // Fixed button height
              child: ElevatedButton(
                onPressed: _isChecked
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogInScreen()),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 5, 24, 39),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LogInScreen()),
                  );
                },
                child: const Text.rich(
                  TextSpan(
                    text: 'Already have an account? ',
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {bool obscureText = false}) {
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: 5), // Reduced vertical padding
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey, width: 1), // Border around the container
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none, // Remove default border
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 10), // Reduced horizontal padding
        ),
      ),
    );
  }
}
