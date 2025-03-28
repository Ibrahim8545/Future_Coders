import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(ImageAssets.curveImage),
        Padding(
          padding: const EdgeInsets.only(top: 65, left: 20),
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ColorManager.white,
              ),
              child: Icon(
                Icons.arrow_back,
                color: ColorManager.primary700,
                size: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
