import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/features/main/widgets/custom_nav_bar_item.dart';
import 'package:flutter/material.dart';

BottomNavigationBar buildBottomNavigationBar(int currentIndex,changeSelectedIndex) {
  return BottomNavigationBar(
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
      CustomBottomNavBarItem(IconsAssets.icProfile, "Settings"),

    ],
  );
}