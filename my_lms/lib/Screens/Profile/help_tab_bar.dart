import 'package:flutter/material.dart';
import 'package:lms/Widgets/custom_tab_bar_item.dart';

class HelpTabBar extends StatefulWidget {
  final TabController tabController;

  const HelpTabBar({super.key, required this.tabController});

  @override
  State<HelpTabBar> createState() => _HelpTabBarState();
}

class _HelpTabBarState extends State<HelpTabBar> {
  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    widget.tabController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomTabBarItem(
              label: 'FAQ',
              isSelected: widget.tabController.index == 0,
              onTap: () => widget.tabController.index = 0,
            ),
            CustomTabBarItem(
              label: 'Contact Us',
              isSelected: widget.tabController.index == 1,
              onTap: () => widget.tabController.index = 1,
            ),
          ],
        ),
      ),
    );
  }
}
