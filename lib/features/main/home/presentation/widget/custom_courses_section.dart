import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/features/main/home/model/course_model.dart';
import 'package:courseapp/features/main/home/presentation/widget/course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCoursesSection extends StatefulWidget {
  const CustomCoursesSection({super.key});

  @override
  State<CustomCoursesSection> createState() => _CustomCoursesSectionState();
}

class _CustomCoursesSectionState extends State<CustomCoursesSection> {
  int selectedIndex =0;
  final List<CourseModel> allCourses = [
    CourseModel(
      title: "اساسيات البرمجة",
      teacher: "م.أحمد علي",
      lessons: 4,
      duration: "30 دقيقة",
      imagePath: ImageAssets.completeImage,
    ),
    CourseModel(
      title: "تصميم التطبيقات والمواقع",
      teacher: "م.أحمد علي",
      lessons: 6,
      duration: "  30 دقيقة",
      imagePath: ImageAssets.notCompleteImg,
    ),
    CourseModel(
      title: "برمجة الالعاب",
      teacher: "م.أحمد علي",
      lessons: 4,
      duration: "  30 دقيقة",
      imagePath: ImageAssets.notComplete,
    ),
    CourseModel(
      title: "التفكير المنطقي",
      teacher: "م.أحمد علي",
      lessons: 4,
      duration: "  30 دقيقة",
      imagePath: ImageAssets.technologicImg,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*.33,
      child: ListView.builder(
        reverse: true,
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        itemCount: allCourses.length,
        itemBuilder: (context, index) {
          return CourseCard(course: allCourses[index], isSelected: selectedIndex==index, onTap: () {
            setState(() {
              selectedIndex =index;
            });
          },);
        },
      ),
    );
  }
}

