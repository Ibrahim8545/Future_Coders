import 'package:courseapp/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class CustomFavouriteIcon extends StatelessWidget {
  const CustomFavouriteIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.favorite,
          color: ColorManager.primary700,
        ),
      ],
    );
  }
}