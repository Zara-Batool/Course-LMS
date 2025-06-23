import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade300, width: 1.0),
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          _buildNavItem(Icons.home, 0),
          _buildNavItem(Icons.menu_book, 1), // Courses icon
          _buildNavItem(Icons.chat, 2),
          _buildNavItem(Icons.person, 3),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 5, 24, 39),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: (index) {
          onItemTapped(index);
        },
        showUnselectedLabels: false,
        showSelectedLabels: false,
        iconSize: 24,
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, int index) {
    return BottomNavigationBarItem(
      icon: GestureDetector(
        onTap: () => onItemTapped(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Icon(
                icon,
                size: 20,
                color: selectedIndex == index
                    ? const Color.fromARGB(255, 5, 24, 39) // Active icon color
                    : Colors.grey,
              ),
            ),
            if (selectedIndex == index)
              Container(
                height: 2,
                width: 20,
                color: const Color.fromARGB(255, 5, 24, 39), // Underline color
              ),
          ],
        ),
      ),
      label: '',
    );
  }
}
