import 'package:courseapp/utils/color_manager.dart';
import 'package:courseapp/utils/values_manager.dart';
import 'package:flutter/material.dart';

class CustomRowTextAndIconSettings extends StatelessWidget {
  const CustomRowTextAndIconSettings(
      {super.key, required this.title, required this.iconPath});

  final String title;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Row(
      // spacing: AppSize.s10,
      children: [
        const SizedBox(width: AppSize.s12),
        ImageIcon(
          AssetImage(iconPath),
          color: ColorManager.white,
        ),
        const SizedBox(width: AppSize.s10),
        Text(
          title,
          textAlign: TextAlign.right,
          style: TextStyle(
            color: ColorManager.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
