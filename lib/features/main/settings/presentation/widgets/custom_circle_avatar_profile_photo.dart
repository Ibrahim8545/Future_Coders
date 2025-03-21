import 'package:courseapp/utils/assets_manager.dart';
import 'package:courseapp/utils/color_manager.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatarProfilePhoto extends StatelessWidget {
  const CustomCircleAvatarProfilePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 65,
          backgroundColor: ColorManager.orange,
          backgroundImage: const AssetImage(
            ImageAssets.kidsImg,
          ),
        ),
        Positioned(
          bottom: 3,
          right: MediaQuery.of(context).size.width*.4,
          child: Image.asset(ImageAssets.uploadImage),
        ),
      ],
    );
  }
}