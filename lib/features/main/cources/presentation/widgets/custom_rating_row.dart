import 'package:courseapp/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomRatingRow extends StatelessWidget {
  const CustomRatingRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(FontAwesomeIcons.solidStar,color: ColorManager.yellow200,size: 20),
        SizedBox(width: 10.w),
        Icon(FontAwesomeIcons.solidStar,color: ColorManager.yellow200,size: 20),
        SizedBox(width: 10.w),
        Icon(FontAwesomeIcons.solidStar,color: ColorManager.yellow200,size: 20),
        SizedBox(width: 10.w),
        Icon(FontAwesomeIcons.solidStar,color: ColorManager.yellow200,size: 20),
        SizedBox(width: 10.w),
        Icon(FontAwesomeIcons.solidStar,color: ColorManager.yellow200,size: 20),
      ],
    );
  }
}