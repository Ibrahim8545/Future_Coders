import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/features/main/home/model/course_model.dart';
import 'package:courseapp/features/main/home/presentation/widget/course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCoursesSection extends StatelessWidget {
  CustomCoursesSection({super.key});

  final List<CourseModel> allCourses = [
    CourseModel(
      title: "اساسيات البرمجة",
      teacher: "م.أحمد علي",
      lessons: 4,
      duration: "30 دقيقة",
      imagePath: ImageAssets.completeImage,
    ),
    CourseModel(
      title: "اساسيات البرمجة",
      teacher: "م.أحمد علي",
      lessons: 4,
      duration: "  30 دقيقة",
      imagePath: ImageAssets.completeImage,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: ListView.builder(
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        itemCount: allCourses.length, // for example, repeat course 4 times
        itemBuilder: (context, index) {
          return CourseCard(course: allCourses[index]);
        },
      ),
    );
  }
}

