import 'package:courseapp/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

BottomNavigationBarItem CustomBottomNavBarItem(String iconPath, String label) {
  return BottomNavigationBarItem(
    icon: Image.asset(
      iconPath,
      color: ColorManager.black500, // unselected
      width: 50,
      height: 50,
    ),
    activeIcon: CircleAvatar(
      radius: 25,
      backgroundColor: ColorManager.primary700,
      child: Image.asset(
        iconPath,
        color: Colors.white, // selected
        width: 50,
        height: 50,
      ),
    ),
    label: label,
  );
}
