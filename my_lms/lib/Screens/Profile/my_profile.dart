import 'package:flutter/material.dart';
import 'package:lms/Screens/Profile/certification_page.dart';
import 'package:lms/Screens/Profile/edit_profile.dart';
import 'package:lms/Screens/Profile/feedback_page.dart';
import 'package:lms/Screens/Profile/help_centre.dart';
import 'package:lms/Screens/Profile/my_card.dart';
import 'package:lms/Screens/Profile/privacy_policy.dart';
import 'package:lms/Screens/Profile/saved_course_page.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool _isFeedbackVisible = false;

  void _toggleFeedbackVisibility() {
    setState(() {
      _isFeedbackVisible = !_isFeedbackVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.all(6.0), // Adding padding to the whole page
            child: Column(
              children: [
                // Profile picture and name section
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/profile.jpg'),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Batool',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditProfile()),
                          );
                        },
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 9, 63, 107),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Menu list items as separate containers
                Expanded(
                  child: ListView(
                    children: [
                      profileSection(
                        icon: Icons.card_membership,
                        title: 'My Certifications',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CertificationPage()),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      profileSection(
                        icon: Icons.work,
                        title: 'My Projects',
                        onTap: () {},
                      ),
                      const SizedBox(height: 10),
                      profileSection(
                        icon: Icons.save,
                        title: 'Saved Course',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SavedCoursePage()),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      profileSection(
                        icon: Icons.credit_card,
                        title: 'My Card',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyCard()),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      profileSection(
                        icon: Icons.help,
                        title: 'Help Center',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HelpCentre()),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      profileSection(
                        icon: Icons.privacy_tip,
                        title: 'Privacy Policy',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PrivacyPolicy()),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      profileSection(
                        icon: Icons.feedback,
                        title: 'Feedback',
                        onTap: _toggleFeedbackVisibility,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (_isFeedbackVisible)
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: FeedbackPage(
                  onClose: _toggleFeedbackVisibility,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget profileSection({
    required IconData icon,
    required String title,
    required Function() onTap,
  }) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 5.0),
      padding: const EdgeInsets.all(6.0),
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
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon,
                color:
                    const Color.fromARGB(255, 9, 63, 107)), // The leading icon
            const SizedBox(width: 10), // Spacing between icon and title
            Expanded(
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ), // Title takes up all the remaining space
            const Icon(Icons.arrow_forward_ios), // Trailing icon
          ],
        ),
      ),
    );
  }
}
