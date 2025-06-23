import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          contactContainer(
            label: 'Customer Service',
            icon: Icons.headset_mic,
          ),
          contactContainer(
            label: 'WhatsApp',
            icon: Icons.whatshot_sharp,
          ),
          contactContainer(
            label: 'Website',
            icon: Icons.web_rounded,
          ),
          contactContainer(
            label: 'Facebook',
            icon: Icons.facebook,
          ),
          contactContainer(
            label: 'Instagram',
            icon: Icons.camera_alt,
          ),
        ],
      ),
    );
  }

  Widget contactContainer({required String label, required IconData icon}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color.fromARGB(255, 11, 69, 116),
                    width: 2.0,
                  ),
                ),
                child: Icon(
                  icon,
                  size: 24, // Reduced icon size
                  color:
                      const Color.fromARGB(255, 11, 69, 116), // Blue icon color
                ),
              ),
              const SizedBox(width: 10), // Reduced space between icon and label
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16, // Reduced font size
                    fontWeight: FontWeight.bold, // Slightly less bold
                    color: Color.fromARGB(
                        255, 11, 69, 116), // Adjusted color for better contrast
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios,
                  size: 20, // Slightly smaller trailing icon
                  color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
