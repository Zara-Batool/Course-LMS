import 'package:flutter/material.dart';
import 'package:lms/Widgets/custom_tab_bar_item.dart';

class CourseTabBar extends StatefulWidget {
  final TabController tabController;

  const CourseTabBar({super.key, required this.tabController});

  @override
  State<CourseTabBar> createState() => _CourseTabBarState();
}

class _CourseTabBarState extends State<CourseTabBar> {
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
              label: 'Ongoing',
              isSelected: widget.tabController.index == 0,
              onTap: () => widget.tabController.index = 0,
            ),
            CustomTabBarItem(
              label: 'Completed',
              isSelected: widget.tabController.index == 1,
              onTap: () => widget.tabController.index = 1,
            ),
          ],
        ),
      ),
    );
  }
}
