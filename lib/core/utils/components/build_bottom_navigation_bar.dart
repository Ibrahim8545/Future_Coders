import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/main/widgets/custom_nav_bar_item.dart';
import 'package:flutter/material.dart';

BottomNavigationBar buildBottomNavigationBar(int currentIndex,changeSelectedIndex) {
  return BottomNavigationBar(
    selectedItemColor: ColorManager.primary700,
    selectedLabelStyle: getMediumStyle(color: ColorManager.primary700,fontSize: 16),
    currentIndex: currentIndex,
    onTap: changeSelectedIndex,
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: ColorManager.black700,
    showSelectedLabels: true,
    showUnselectedLabels: false,
    elevation: 10,
    items: [
      CustomBottomNavBarItem(IconsAssets.icHome, "الرئيسية",),
      CustomBottomNavBarItem(IconsAssets.icCourses, "كورساتي"),
      CustomBottomNavBarItem(IconsAssets.icFathers, "الاباء"),
      CustomBottomNavBarItem(IconsAssets.icCommunity, "مجتمعنا"),
      CustomBottomNavBarItem(IconsAssets.icProfile, "الشخصية"),

    ],
  );
}