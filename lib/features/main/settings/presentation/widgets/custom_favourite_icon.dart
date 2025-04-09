import 'package:flutter/material.dart';
import 'package:courseapp/core/utils/color_manager.dart';

class CustomFavouriteIcon extends StatefulWidget {
  const CustomFavouriteIcon({super.key});

  @override
  State<CustomFavouriteIcon> createState() => _CustomFavouriteIconState();
}

class _CustomFavouriteIconState extends State<CustomFavouriteIcon> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: Icon(
          isFavourite ? Icons.favorite : Icons.favorite_border,
          color: isFavourite ? ColorManager.primary700 : Colors.grey,
        ),
        onPressed: () {
          setState(() {
            isFavourite = !isFavourite;
          });
        },
      ),
    );
  }
}
