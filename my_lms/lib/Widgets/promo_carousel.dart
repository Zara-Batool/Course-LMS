import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PromoCarousel extends StatefulWidget {
  const PromoCarousel({super.key});

  @override
  _PromoCarouselState createState() => _PromoCarouselState();
}

class _PromoCarouselState extends State<PromoCarousel> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView(
            controller: _controller,
            children: [
              _buildPromoCard(
                message: 'Get online certificate.',
                buttonText: 'Get Started',
                imagePath: 'assets/card1.jpg',
              ),
              _buildPromoCard(
                message: 'Learn new skills.',
                buttonText: 'Explore',
                imagePath: 'assets/card2.jpg',
              ),
              _buildPromoCard(
                message: 'Join the community.',
                buttonText: 'Join Now',
                imagePath: 'assets/card3.jpg',
              ),
            ],
          ),
        ),
        SmoothPageIndicator(
          controller: _controller,
          count: 3,
          effect: const WormEffect(
            dotHeight: 8,
            dotWidth: 8,
            dotColor: Colors.grey,
            activeDotColor: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget _buildPromoCard({
    required String message,
    required String buttonText,
    required String imagePath,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.3), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
              ),
            ),
            Positioned(
              left: 16,
              top: 8,
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16, // Smaller font size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: 16,
              bottom: 8,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                onPressed: () {},
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
