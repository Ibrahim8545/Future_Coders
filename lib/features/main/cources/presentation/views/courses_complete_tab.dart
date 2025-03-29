import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/values_manager.dart';
import 'package:courseapp/features/main/cources/presentation/widgets/custom_not_completed_course_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursesCompleteTab extends StatelessWidget {
  const CoursesCompleteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: Column(
            children: [
              CustomNotCompletedCourseContainer(
                textColor: ColorManager.white,
                titleColor: Colors.white,
                color: ColorManager.primary700,
                rate: "100%",
                width: 311,
                text: "٤ دروس",
                iconColor: ColorManager.white,
                title: "اساسيات البرمجة",
                instructorName: 'م.كريم احمد',
                image: ImageAssets.completeImage,
              ),
              SizedBox(
                height: AppSize.s16.h,
              ),
              CustomNotCompletedCourseContainer(
                textColor: ColorManager.white,
                titleColor: Colors.white,
                color: ColorManager.primary700,
                width: MediaQuery.of(context).size.width,
                rate: "100%",
                text: "٤ دروس",
                iconColor: ColorManager.white,
                title: "التفكير المنطقي",
                instructorName: '  م.محمد ربيع ',
                image: ImageAssets.technologicImg,
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
