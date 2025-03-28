import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/values_manager.dart';
import 'package:courseapp/features/main/cources/presentation/widgets/custom_not_completed_course_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursesNotCompleteTab extends StatelessWidget {
  const CoursesNotCompleteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: Column(
            children: [
              CustomNotCompletedCourseContainer(
                titleColor:ColorManager.black500,
                textColor: ColorManager.black400,
                width: 198,
                rate: "65%",
                text: "٤ دروس",
                iconColor: ColorManager.primary700,
                title: "برمجه الالعاب",
                instructorName: 'م.كريم احمد',
                image: ImageAssets.notComplete,
              ),
              SizedBox(
                height: AppSize.s16.h,
              ),
              CustomNotCompletedCourseContainer(
                titleColor:ColorManager.black500,
                textColor: ColorManager.black400,
                width: 198,
                rate: "65%",
                text: "٤ دروس",
                iconColor: ColorManager.primary700,
                title: "تصميم المواقع والتطبيقات",
                instructorName: ' م.أحمد علي ',
                image: ImageAssets.notCompleteImg,
              ),
              SizedBox(
                height: AppSize.s16.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}





