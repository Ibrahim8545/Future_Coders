import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/main/home/model/course_model.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseCard extends StatelessWidget {
  final CourseModel course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343.w, // set width to fix layout inside horizontal ListView
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: ColorManager.primary700,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                const Icon(Icons.favorite_border, color: Colors.white),
                const Spacer(),
                Text(
                  course.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(course.imagePath, height: 60.h),
                SizedBox(width: 10.w),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "${course.teacher}",
                          style: getMediumStyle(
                              color: ColorManager.white, fontSize: 15),
                        ),
                        Icon(
                          Icons.person,
                          color: ColorManager.white,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "   ${course.lessons} دروس",
                          style: getMediumStyle(
                              color: ColorManager.white, fontSize: 15),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.menu_book_rounded,
                          color: ColorManager.white,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          course.duration,
                          style: getMediumStyle(
                              color: ColorManager.white, fontSize: 15),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.access_time_filled,
                          color: ColorManager.white,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            CustomElevatedButton(
              textColor: ColorManager.primary700,
              title: "ابدأ الان",
              onPressed: () {},
              color: ColorManager.white,
            ),
          ],
        ),
      ),
    );
  }
}
