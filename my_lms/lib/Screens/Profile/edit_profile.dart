import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  // Controllers for the text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set initial values for the fields
    _nameController.text = 'Batool';
    _emailController.text = 'batoolzara@gmail.com';
    _phoneController.text = '(704) 555-0127';
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is removed from the widget tree
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 15),
            // Profile picture
            const CircleAvatar(
              radius: 40,
              backgroundImage:
                  AssetImage('assets/profile.jpg'), // Replace with actual image
            ),
            const SizedBox(height: 30),
            // Name TextField
            profileTextField(
              icon: Icons.person,
              hintText: 'Name',
              controller: _nameController,
            ),
            const SizedBox(height: 20),
            // Email TextField
            profileTextField(
              icon: Icons.email,
              hintText: 'Email',
              controller: _emailController,
            ),
            const SizedBox(height: 20),
            // Phone Number TextField
            profileTextField(
              icon: Icons.phone,
              hintText: 'Phone Number',
              controller: _phoneController,
            ),
            const Spacer(),
            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: const Color.fromARGB(255, 11, 69, 116),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // A reusable method for profile text fields
  Widget profileTextField({
    required IconData icon,
    required String hintText,
    required TextEditingController controller,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Rounded corners
        color: Colors.white, // Background color
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // Changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0), // Padding around the icon
            child: Icon(
              icon,
              color: const Color.fromARGB(255, 11, 69, 116), // Icon color
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none, // Remove default border
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
