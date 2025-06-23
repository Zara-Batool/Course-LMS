import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final List<Map<String, String>> paymentMethods = [
    {
      'name': 'Paypal',
      'image': 'assets/paypal.png', // Path to your Paypal image
    },
    {
      'name': 'Master Card',
      'image': 'assets/mastercard.png', // Path to your MasterCard image
    },
    {
      'name': 'Visa',
      'image': 'assets/visa.png', // Path to your Visa image
    },
    {
      'name': 'Cash',
      'image': 'assets/cash.png', // Path to your Cash image
    },
  ];

  MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Payment',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10.0), // Padding around the screen
        child: ListView.builder(
          itemCount: paymentMethods.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(
                  vertical: 8.0), // Spacing between cards
              padding: const EdgeInsets.all(12.0), // Padding inside the card
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
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      paymentMethods[index]['image']!,
                      width: 30, // Adjusted width for smaller icon size
                      height: 30, // Adjusted height for smaller icon size
                    ),
                    const SizedBox(
                        width: 20), // Increased spacing between image and title
                    Expanded(
                      child: Text(
                        paymentMethods[index]['name']!,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Icon(Icons.more_vert), // Three dots icon
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color:
                const Color.fromARGB(255, 11, 69, 116), // Move the color here
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'Add New Card',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
