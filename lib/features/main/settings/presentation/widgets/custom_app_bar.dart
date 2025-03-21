import 'package:courseapp/utils/assets_manager.dart';
import 'package:courseapp/utils/values_manager.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(ImageAssets.curveImage),
        Padding(
          padding: const EdgeInsets.only(top: AppPadding.p20),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(IconsAssets.arrowBack),
          ),
        ),
      ],
    );
  }
}
