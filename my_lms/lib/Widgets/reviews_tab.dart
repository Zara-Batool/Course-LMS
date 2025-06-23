import 'package:flutter/material.dart';

class ReviewsTab extends StatefulWidget {
  const ReviewsTab({super.key});

  @override
  _ReviewsTabState createState() => _ReviewsTabState();
}

class _ReviewsTabState extends State<ReviewsTab> {
  double _selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Rating & Reviews",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  "4.5",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildStarRating(4.5, size: 24),
                    const SizedBox(height: 8),
                    const Text("out of 5"),
                  ],
                ),
                const Spacer(),
                const Text(
                  "1k Reviews",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            _buildReviewItem(
              "Thank You For Your Services. That Save My Time Very Much",
              "1 day ago",
              "assets/profile.jpg",
            ),
            _buildReviewItem(
              "This app is very useful for all the person in around",
              "2 days ago",
              "assets/profile.jpg",
            ),
            _buildReviewItem(
              "This app is very useful for all the person in around",
              "3 days ago",
              "assets/profile.jpg",
            ),
            const SizedBox(height: 10),
            const Text(
              "Write A Review",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                _buildInteractiveStarRating(),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 160, 206, 243),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    minimumSize: const Size(30, 30),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInteractiveStarRating() {
    return Row(
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < _selectedRating ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 24,
          ),
          onPressed: () {
            setState(() {
              _selectedRating = index + 1.0;
            });
          },
        );
      }),
    );
  }

  Widget _buildStarRating(double rating, {double size = 18}) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          size: size,
          color: Colors.amber,
        );
      }),
    );
  }

  Widget _buildReviewItem(String text, String time, String avatarPath) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage("assets/profile.jpg"),
      ),
      title: Text(
        text,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Row(
        children: [
          const Spacer(),
          Text(
            time,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      trailing: const Icon(Icons.more_vert),
    );
  }
}
