import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar_title.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgrammingViewBody extends StatefulWidget {
  const ProgrammingViewBody({super.key});

  @override
  State<ProgrammingViewBody> createState() => _ProgrammingViewBodyState();
}

class _ProgrammingViewBodyState extends State<ProgrammingViewBody> {
  final List<CourseModel> courses = [
    CourseModel(
      title: "مقدمة إلى البرمجة",
      image: ImageAssets.introProgramming,
      youtubeUrl: "https://youtu.be/BhRJ92pDDnQ?si=oyzn5zlSQmY9Ttf9",
    ),
    CourseModel(
      title: "اساسيات البرمجة",
      image: ImageAssets.principlesPro,
      youtubeUrl: "https://youtu.be/BqfAojM4ECQ?si=lJk03L2ZSNYM3uIK",
    ),
    CourseModel(
      title: "الدوال",
      image: ImageAssets.functions,
      youtubeUrl: "https://youtu.be/ZxrO7wUNtbc?si=A-ig5NMn9Hr_eXAh",
    ),
    CourseModel(
      title: "البرمجة الكائنية",
      image: ImageAssets.oop,
      youtubeUrl: "https://youtu.be/Tao5nFT7zp0?si=XL_uaxJV3m8O5zwV",
    ),
    CourseModel(
      title: "مشاريع تطبيقية بسيطة",
      image: ImageAssets.projects,
      youtubeUrl: "https://youtu.be/gUtF_6VPjOE?si=9jOPpeiIOhwJapfb",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomRowAppBarTitle(title: "اساسيات البرمجة"),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 16.h),
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return CourseCard(
                      course: courses[index],
                      isSelected: index == 0, // Just for demo
                    );
                  },
                ),
              )
            ],
          ),
        ),
        CustomAppBar()
      ],
    );
  }
}

class CourseCard extends StatelessWidget {
  final CourseModel course;
  final bool isSelected;

  const CourseCard({
    super.key,
    required this.course,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 148.h,
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: isSelected ? ColorManager.primary700 : Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: ColorManager.primary700, width: 2),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(course.image),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  course.title,
                  style: getMediumStyle(
                    color: isSelected
                        ? ColorManager.white
                        : ColorManager.primary700,
                  ),
                ),
                CustomElevatedButton(
                    title: "ابدا الان",
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.videoPlayerView,
                          arguments: course.youtubeUrl);
                    },
                    color: isSelected
                        ? ColorManager.white
                        : ColorManager.primary700,
                    textColor:
                        isSelected ? ColorManager.primary700 : Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// models/course_model.dart
class CourseModel {
  final String title;
  final String image;
  final String youtubeUrl;

  CourseModel({
    required this.title,
    required this.image,
    required this.youtubeUrl,
  });
}
