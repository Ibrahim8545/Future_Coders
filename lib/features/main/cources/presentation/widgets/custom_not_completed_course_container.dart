import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/components/build_box_decoration.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/core/utils/values_manager.dart';
import 'package:courseapp/features/main/cources/presentation/widgets/custom_progress_bar.dart';
import 'package:courseapp/features/main/cources/presentation/widgets/custom_rating_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNotCompletedCourseContainer extends StatelessWidget {
  const CustomNotCompletedCourseContainer(
      {super.key,
      required this.title,
      required this.instructorName,
      required this.iconColor,
      required this.text,
      required this.image,
      required this.rate,
      required this.width,  this.color=Colors.white, required this.textColor, required this.titleColor});

  final String title;
  final String text;
  final String instructorName;
  final Color iconColor;
  final Color textColor;
  final Color titleColor;
  final String image;
  final String rate;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p16,
      ),
      decoration: buildBoxDecoration(color: color),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            image,
          ),
          Text(
            title,
            textAlign: TextAlign.end,
            style: getMediumStyle(color: titleColor),
          ),
          SizedBox(
            height: AppSize.s8.h,
          ),
          Row(
            children: [
              Text(
                text,
                style: getMediumStyle(
                  color: textColor,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(
                width: 5.sp,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  FontAwesomeIcons.bookOpen,
                  color: iconColor,
                ),
              ),
              const Spacer(),
              Text(
                instructorName,
                style: getMediumStyle(
                  color: textColor,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(
                width: 5.sp,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ImageIcon(
                  AssetImage(
                    IconsAssets.userIc,
                  ),
                  color: iconColor,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSize.s12.h),
          Row(
            children: [
              Text(
                text,
                style: getMediumStyle(
                  color: textColor,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(
                width: 5.sp,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  FontAwesomeIcons.solidClock,
                  color: iconColor,
                ),
              ),
              const Spacer(),
              Text(
                "+500 طالب مسجل",
                style: getMediumStyle(
                  color: textColor,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(
                width: 5.sp,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(ImageAssets.participationImage),
              ),
            ],
          ),
          SizedBox(height: AppSize.s16.h),
          const CustomRatingRow(),
          SizedBox(height: AppSize.s16.h),
          CustomCourseProgressBar(
            rate: rate,
            width: width,
          ),
        ],
      ),
    );
  }
}
