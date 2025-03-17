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
  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const CoursesTab(),
    const FathersTab(),
    const CommunityTab(),
    const SettingsTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: changeSelectedIndex,
        items: [],
      ),
    );
  }

  void changeSelectedIndex(selectedIndex) {
    setState(() {
      currentIndex = selectedIndex;
    });
  }
}

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  String iconPath;
  String title;
  CustomBottomNavBarItem(this.iconPath, this.title)
      : super(
    label: title,
    icon: ImageIcon(
      AssetImage(iconPath), // Inactive icon image
      color: Colors.white, // Inactive icon color
    ),
    activeIcon: CircleAvatar(
      backgroundColor: Colors.white, // Background of active icon
      child: ImageIcon(
        AssetImage(iconPath), // Active icon imagecolor: ColorManager.primary, // Active icon color
      ),
    ),
  );
}
