import 'package:courseapp/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  String iconPath;
  String title;

  CustomBottomNavBarItem(
      this.iconPath,
      this.title,
      ) : super(
    label: title,
    icon: ImageIcon(
      size: 35,
      AssetImage(iconPath), // Inactive icon image
      // Inactive icon color
    ),
    activeIcon: CircleAvatar(
      radius: 30,
      backgroundColor:
      ColorManager.primary700, // Background of active icon
      child: ImageIcon(
        AssetImage(
            iconPath), // Active icon imageColor: ColorManager.primary, // Active icon color
      ),
    ),
  );
}
