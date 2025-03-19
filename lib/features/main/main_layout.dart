import 'package:courseapp/features/main/community/community_tab.dart';
import 'package:courseapp/features/main/cources/courses_tab.dart';
import 'package:courseapp/features/main/fathers/fathers_tab.dart';
import 'package:courseapp/features/main/settings/settings_tab.dart';
import 'package:courseapp/utils/assets_manager.dart';
import 'package:courseapp/utils/color_manager.dart';
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
        selectedLabelStyle: TextStyle(
          color: ColorManager.primary700
        ),
        currentIndex: currentIndex,
        onTap: changeSelectedIndex,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: ColorManager.black700,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        elevation: 10,
        items: [
          CustomBottomNavBarItem(IconsAssets.icHome, "Home",),
          CustomBottomNavBarItem(IconsAssets.icCourses, "Courses"),
          CustomBottomNavBarItem(IconsAssets.icFathers, "Fathers"),
          CustomBottomNavBarItem(IconsAssets.icCommunity, "Community"),
          CustomBottomNavBarItem(IconsAssets.settingIcon, "Settings"),

        ],
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
  CustomBottomNavBarItem(this.iconPath, this.title,)
      : super(
    label: title,
    icon: ImageIcon(
      size: 35,
      AssetImage(iconPath), // Inactive icon image
       // Inactive icon color
    ),
    activeIcon: CircleAvatar(
      radius: 30,
      backgroundColor: ColorManager.primary700, // Background of active icon
      child: ImageIcon(
        AssetImage(iconPath), // Active icon imageColor: ColorManager.primary, // Active icon color
      ),
    ),
  );
}
