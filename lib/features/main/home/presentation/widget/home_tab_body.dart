import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_textfield.dart';
import 'package:courseapp/features/main/home/presentation/widget/custom_section_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTabBody extends StatelessWidget {
  const HomeTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
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
          SizedBox(
            height: 4.h,
          ),
          Text(
            'هل انت جاهز للتعلم اليوم ؟',
            style: getLightStyle(color: Color(0xff999999))
                .copyWith(fontSize: 14.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTextField(
            suffixIcon: Icon(Icons.search),
            prefixIcon: Icon(Icons.speaker),
            hint: '...ابحث عن الدورات, المعلمين',
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            padding: const EdgeInsets.all(7.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Color(0xff000000).withOpacity(0.25),
              ),
            ),
            child: CustomSectionCourse(),
          ),
        ],
      ),
    );
  }
}
