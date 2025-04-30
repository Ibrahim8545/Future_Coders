import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SnackBarContentWidget extends StatelessWidget {
  const SnackBarContentWidget({
    super.key, required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          content,
          style: getMediumStyle(
            color: ColorManager.white,
            fontSize: 18.sp,
          ),
        ),
        SizedBox(width: 10.w),
        const Icon(
          size: 30,
          Icons.check,
          color: ColorManager.green600,
        )
      ],
    );
  }
}
