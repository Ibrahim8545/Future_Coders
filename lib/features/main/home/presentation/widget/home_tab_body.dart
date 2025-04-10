import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_textfield.dart';
import 'package:courseapp/features/main/home/model/course_model.dart';
import 'package:courseapp/features/main/home/model/section_model.dart';
import 'package:courseapp/features/main/home/presentation/widget/custom_courses_section.dart';
import 'package:courseapp/features/main/home/presentation/widget/custom_section_course.dart';
import 'package:courseapp/features/main/home/presentation/widget/custom_setion_widget.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_row_text_favourite_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTabBody extends StatelessWidget {
  const HomeTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/images/hi.png'),
                SizedBox(width: 8.w),
                Text(
                  'مرحبا',
                  style: getBoldStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'هل انت جاهز للتعلم اليوم ؟',
              style: getLightStyle(color: const Color(0xff999999))
                  .copyWith(fontSize: 14.sp),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomTextField(
              suffixIcon: const Icon(Icons.search),
              prefixIcon: const Icon(Icons.speaker),
              hint: '...ابحث عن الدورات, المعلمين',
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.all(7.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xff000000).withOpacity(0.25),
                ),
              ),
              child: const CustomSectionCourse(),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          const CustomRowTextFavouriteView(title: "الاقسام"),
          const CustomSectionWidget(),
          const CustomRowTextFavouriteView(title: "استكشف دوراتنا"),
          CustomCoursesSection()
        ],
      ),
    );
  }
}



