import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProgressContainer extends StatelessWidget {
  const CustomProgressContainer(
      {super.key,
        required this.color,
        required this.numberCourses,
        required this.title});

  final Color color;
  final int numberCourses;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          children: [
            Text(
              numberCourses.toString(),
              style: getBoldStyle(color: ColorManager.black500),
            ),
            Text(
              title,
              style: getMediumStyle(color: ColorManager.black500),
            ),
          ],
        ),
      ),
    );
  }
}
