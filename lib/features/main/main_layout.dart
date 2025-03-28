import 'package:courseapp/core/utils/components/build_bottom_navigation_bar.dart';
import 'package:courseapp/features/main/community/community_tab.dart';
import 'package:courseapp/features/main/cources/courses_tab.dart';
import 'package:courseapp/features/main/fathers/fathers_tab.dart';
import 'package:courseapp/features/main/settings/settings_tab.dart';
import 'package:flutter/material.dart';

import 'home/home_tab.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 4;
  List<Widget> tabs = [
    const HomeTab(),
     CoursesTab(),
    const FathersTab(),
    const CommunityTab(),
    const SettingsTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: buildBottomNavigationBar(
        currentIndex,
        changeSelectedIndex,
      ),
    );
  }

  void changeSelectedIndex(selectedIndex) {
    setState(() {
      currentIndex = selectedIndex;
    });
  }
}

