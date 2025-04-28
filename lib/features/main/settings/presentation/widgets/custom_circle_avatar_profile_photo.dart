import 'dart:io';
import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatarProfilePhoto extends StatefulWidget {
  CustomCircleAvatarProfilePhoto({
    super.key,
    this.selectedImage,
  });

  File? selectedImage;

  @override
  State<CustomCircleAvatarProfilePhoto> createState() =>
      _CustomCircleAvatarProfilePhotoState();
}

class _CustomCircleAvatarProfilePhotoState
    extends State<CustomCircleAvatarProfilePhoto> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          radius: 65,
          child: widget.selectedImage != null
              ? ClipOval(
                child: Image.file(
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                    widget.selectedImage!,
                  ),
              )
              : Image.asset(ImageAssets.kidsImg),
        ),
        Positioned(
          bottom: 3,
          right: MediaQuery.of(context).size.width * .4,
          child: ClipRRect(child: Image.asset(ImageAssets.uploadImage)),
        ),
      ],
    );
  }
}
