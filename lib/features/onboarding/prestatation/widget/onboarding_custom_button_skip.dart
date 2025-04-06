import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';

class CustomSkipBotton extends StatelessWidget {
  CustomSkipBotton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.color,
      re});
  String text;
  VoidCallback onTap;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff0A638F),width: 3),
            borderRadius: BorderRadius.circular(8),
            color: color),
        width: double.infinity,
        height: 60,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: getMediumStyle(color: Colors.black)),
          ],
        )),
      ),
    );
  }
}
