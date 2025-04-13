import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';

class CustomSocialReactions extends StatelessWidget {
  const CustomSocialReactions({
    super.key, required this.icon, required this.title,
  });
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageIcon(AssetImage(icon),),
        Text(title,style: getMediumStyle(color: ColorManager.black500,fontSize: 18),),
      ],
    );
  }
}
