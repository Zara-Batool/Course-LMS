import 'package:flutter/material.dart';
import 'package:lms/Screens/Profile/contact_us.dart';
import 'package:lms/Screens/Profile/faq.dart';
import 'package:lms/Screens/Profile/help_tab_bar.dart';

class HelpCentre extends StatefulWidget {
  const HelpCentre({super.key});

  @override
  State<HelpCentre> createState() => _HelpCentreState();
}

class _HelpCentreState extends State<HelpCentre>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Help Centre',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HelpTabBar(tabController: tabController),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                Faq(),
                ContactUs(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
