import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.onTap,
      required this.text,
       this.color,
      re});
  String text;
  VoidCallback onTap;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(8),
                color: color),
        width: double.infinity,
        height: 60,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: getMediumStyle(color: ColorManager.white)),
          ],
        )),
      ),
    );
  }
}
