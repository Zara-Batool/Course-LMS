import 'package:flutter/material.dart';
import 'package:lms/Screens/Chat/chat_details.dart';
import 'package:lms/Widgets/search_bar.dart';

class MyChat extends StatefulWidget {
  const MyChat({super.key});
  @override
  State<MyChat> createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
  final List<Map<String, dynamic>> profiles = [
    {
      'name': 'Alice',
      'imagePath': 'assets/instructor1.jpeg',
      'recentMessage': 'Hey, how are you?',
      'isOnline': true,
      'unreadMessages': 3,
      'time': '12:30 PM'
    },
    {
      'name': 'Bob',
      'imagePath': 'assets/instructor2.jpeg',
      'recentMessage': 'What are you doing?',
      'isOnline': true,
      'unreadMessages': 1,
      'time': '1:00 PM'
    },
    {
      'name': 'Charlie',
      'imagePath': 'assets/instructor3.jpeg',
      'recentMessage': 'Let\'s meet tomorrow.',
      'isOnline': false,
      'unreadMessages': 2,
      'time': '2:30 PM'
    },
    {
      'name': 'Batool',
      'imagePath': 'assets/instructor4.jpeg',
      'recentMessage': 'Good morning!',
      'isOnline': true,
      'unreadMessages': 0,
      'time': '11:45 AM'
    },
  ];

  // Update _onChatTap method to pass avatarUrl
  void _onChatTap(int index) {
    final profile = profiles[index]; // Get the tapped profile
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatDetailScreen(
          name: profile['name']!,
          avatarUrl: profile['imagePath']!, // Pass the avatar path
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              const MySearchBar(),
              const SizedBox(height: 16),

              // Horizontal list of profiles
              SizedBox(
                height: 70, // Adjust the height as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: profiles.length,
                  itemBuilder: (context, index) {
                    final profile = profiles[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        child: Column(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage:
                                      AssetImage(profile['imagePath']!),
                                ),
                                if (profile[
                                    'isOnline']) // Show online indicator
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      decoration: const BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            Text(profile['name']!), // Display user's name
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),

              // List of chat containers
              ListView.builder(
                shrinkWrap: true,
                itemCount: profiles.length, // Using profiles for chats
                itemBuilder: (context, index) {
                  final profile = profiles[index];
                  return GestureDetector(
                    onTap: () => _onChatTap(index), // Pass the index here
                    child: Container(
                      height: 60,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 10.0),
                      padding: const EdgeInsets.all(10.0),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage(profile['imagePath']!),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(profile['name']!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  Text(profile['recentMessage']!,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color:
                                              Colors.grey)), // Recent message
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Unread messages indicator above time
                              if (profile['unreadMessages'] > 0)
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 10, 57, 95),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    profile['unreadMessages'].toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              const SizedBox(
                                  height:
                                      1), // Space between unread messages and time
                              Text(profile['time']!,
                                  style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.black)), // Chat time
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      // Floating action button with pen icon
      floatingActionButton: Container(
        width: 56.0, // Width of the container
        height: 56.0, // Height of the container
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color.fromARGB(255, 10, 57, 95), // Border color
            width: 3, // Border width
          ),
        ),
        child: FloatingActionButton(
          onPressed: () {}, // Your onPressed function
          backgroundColor:
              const Color.fromARGB(255, 10, 57, 95), // Button color
          child: const Icon(
            Icons.edit,
            color: Colors.white, // Icon color
          ),
        ),
      ),
    );
  }
}
