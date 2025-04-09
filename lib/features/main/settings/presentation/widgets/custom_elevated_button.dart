import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
   const CustomElevatedButton({
    super.key, required this.title,
     required this.onPressed
  });
  final String title;
 final  void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.primary700,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(
                  AppSize.s8,
                )))),
        child: Row(
          children: [
            Image.asset(
              IconsAssets.BULBCIcon,
              color: Colors.white,
            ),
            Text(
              title,
              style: getMediumStyle(color: ColorManager.white),
            ),
          ],
        ));
  }
}
