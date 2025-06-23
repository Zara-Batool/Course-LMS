import 'package:flutter/material.dart';

class ChatDetailScreen extends StatefulWidget {
  final String name;
  final String avatarUrl;

  const ChatDetailScreen(
      {super.key, required this.name, required this.avatarUrl});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  List<Message> messages = [
    Message(
        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        isSender: false,
        time: "2:55 PM",
        isRead: true),
    Message(
        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        isSender: true,
        time: "3:02 PM",
        isRead: true),
    Message(
        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        isSender: false,
        time: "3:10 PM",
        isRead: false),
    Message(
        text:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
        isSender: true,
        time: "3:15 PM",
        isRead: true),
  ];

  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add(Message(
            text: _controller.text,
            isSender: true,
            time: "3:20 PM",
            isRead: false));
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(widget.avatarUrl),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const Text('Online',
                    style: TextStyle(color: Colors.green, fontSize: 12)),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.call),
              onPressed: () {
                // Handle call action
              },
            ),
            IconButton(
              icon: const Icon(Icons.videocam),
              onPressed: () {
                // Handle video call action
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return _buildMessageBubble(messages[index]);
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15.0), // Only keep left padding
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Your message",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: _sendMessage,
                      color: Colors.white,
                      padding: EdgeInsets
                          .zero, // Remove padding to bring it closer to the edge
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Message message) {
    return Align(
      alignment:
          message.isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: message.isSender
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: message.isSender ? Colors.blue[100] : Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              message.text,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          // Row for time and read indicator
          Row(
            mainAxisAlignment: message.isSender
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Text(
                message.time,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
              const SizedBox(width: 5),
              if (message.isRead) // Show double tick if read
                const Icon(Icons.check_circle, size: 12, color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isSender;
  final String time;
  final bool isRead;

  Message({
    required this.text,
    required this.isSender,
    required this.time,
    required this.isRead,
  });
}
