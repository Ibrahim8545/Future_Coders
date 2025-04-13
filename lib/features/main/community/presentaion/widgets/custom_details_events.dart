import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';

class CustomDetailsEvents extends StatelessWidget {
  const CustomDetailsEvents(
      {super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Icon(icon,color: ColorManager.primary700,),
          Text(
            title,
            style: getMediumStyle(
              color: ColorManager.black500,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}