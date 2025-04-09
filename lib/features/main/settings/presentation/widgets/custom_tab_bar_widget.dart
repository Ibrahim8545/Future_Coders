import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class CustomTabBarWidget extends StatelessWidget {
  final TabController controller;
  final List<Tab> tabs;

  const CustomTabBarWidget({
    super.key,
    required this.controller,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p12, vertical: AppPadding.p28),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ButtonsTabBar(
          controller: controller,
          height: 55,
          buttonMargin: const EdgeInsets.symmetric(horizontal: 10),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          backgroundColor: ColorManager.primary700,
          borderWidth: 1.5,
          unselectedBackgroundColor: ColorManager.white,
          unselectedBorderColor: ColorManager.primary700,
          unselectedLabelStyle: getMediumStyle(color: ColorManager.primary700),
          labelStyle: getMediumStyle(color: ColorManager.white),
          tabs: tabs,
        ),
      ),
    );
  }
}
