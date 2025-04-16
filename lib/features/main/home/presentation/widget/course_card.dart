import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/main/home/model/course_model.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseCard extends StatefulWidget {
  const CourseCard({super.key, required this.course, required this.isSelected, required this.onTap});

  final CourseModel course;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<CourseCard> createState() => _CourseCardState();
}
class _CourseCardState extends State<CourseCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375.w,
      height: MediaQuery.of(context).size.height * .35,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: widget.isSelected
                ? Border.all(width: 0)
                : Border.all(color: ColorManager.primary700, width: 2),
            color: widget.isSelected ? ColorManager.primary700 : ColorManager.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border,
                          color: widget.isSelected
                              ? Colors.white
                              : ColorManager.primary700)),
                  const Spacer(),
                  Text(
                    widget.course.title,
                    style:getBoldStyle(   color:
                    widget.isSelected ? Colors.white : ColorManager.primary700,
                      fontSize: 22.sp,),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(widget.course.imagePath, height: 130.h),
                  SizedBox(width: 10.w),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "${widget.course.teacher}",
                            style: getMediumStyle(
                                color: widget.isSelected
                                    ? Colors.white
                                    : ColorManager.primary700,
                                fontSize: 15.sp),
                          ),
                          Icon(
                            Icons.person,
                            color: widget.isSelected
                                ? Colors.white
                                : ColorManager.primary700,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "   ${widget.course.lessons} دروس",
                            style: getMediumStyle(
                                color: widget.isSelected
                                    ? Colors.white
                                    : ColorManager.primary700,
                                fontSize: 15.sp),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Icon(
                            Icons.menu_book_rounded,
                            color: widget.isSelected
                                ? Colors.white
                                : ColorManager.primary700,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        children: [
                          Text(
                            widget.course.duration,
                            style: getMediumStyle(
                                color: widget.isSelected
                                    ? Colors.white
                                    : ColorManager.primary700,
                                fontSize: 15.sp),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Icon(
                            Icons.access_time_filled,
                            color: widget.isSelected
                                ? Colors.white
                                : ColorManager.primary700,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              CustomElevatedButton(
                textColor: widget.isSelected?ColorManager.primary700:ColorManager.white,
                title: "ابدأ الان",
                onPressed: () {
                  Navigator.pushNamed(context, Routes.programmingView);
                },
                color: widget.isSelected?ColorManager.white:ColorManager.primary700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
