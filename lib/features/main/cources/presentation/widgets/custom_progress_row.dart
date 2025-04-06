import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/features/main/cources/presentation/widgets/cutsom_progress_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProgressRow extends StatelessWidget {
  const CustomProgressRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            CustomProgressContainer(color: ColorManager.primary100, numberCourses: 20, title: "دروس مكتملة"),
            SizedBox(width: 10.w),
            CustomProgressContainer(color: ColorManager.secondary100, numberCourses: 15, title: "درس مسجل"),
          ],
        ),
      ),
    );
  }
}