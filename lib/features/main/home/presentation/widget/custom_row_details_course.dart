import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';

class CustomRowDetailsCourse extends StatelessWidget {
  const CustomRowDetailsCourse({
    super.key,
    required this.iconData,
    required this.title,
  });

  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData, color: ColorManager.primary700),
        const SizedBox(width: 8),
        Text(
          title,
          style: getMediumStyle(color: ColorManager.black500),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
