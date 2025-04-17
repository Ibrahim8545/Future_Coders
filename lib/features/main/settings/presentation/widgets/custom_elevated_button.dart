import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
   const CustomElevatedButton({
    super.key, required this.title,
     required this.onPressed, required this.color, required this.textColor
  });
  final String title;
 final  void Function() onPressed;
 final Color color;
 final Color textColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 161.w,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(
                    AppSize.s8,
                  )))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                IconsAssets.BULBCIcon,
              ),
              Text(
                title,
                style: getMediumStyle(color: textColor),
              ),
            ],
          )),
    );
  }
}
