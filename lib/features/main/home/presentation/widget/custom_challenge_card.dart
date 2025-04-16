import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/components/build_box_decoration.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_buttom.dart';
import 'package:courseapp/features/main/home/model/challenge_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomChallengeCard extends StatefulWidget {
  final ChallengeModel challenge;
  final bool isSelected;
  final void Function() onTap;

  const CustomChallengeCard(
      {super.key,
      required this.challenge,
      required this.isSelected,
      required this.onTap});

  @override
  State<CustomChallengeCard> createState() => _CustomChallengeCardState();
}

class _CustomChallengeCardState extends State<CustomChallengeCard> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          margin: EdgeInsets.only(bottom: 20.h),
          padding: EdgeInsets.all(12.w),
          decoration: buildBoxDecoration(
            color: widget.isSelected?ColorManager.primary700:ColorManager.white
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Image.asset(
                    widget.challenge.imagePath,
                    width: 130.w,
                    height: 200.h,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.challenge.level,
                          textAlign: TextAlign.center,
                          style: getSemiBoldStyle(
                              color: widget.isSelected?ColorManager.white:ColorManager.black500, fontSize: 24.sp),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          widget.challenge.title,
                          textAlign: TextAlign.center,
                          style: getSemiBoldStyle(
                              color: widget.isSelected?ColorManager.white:ColorManager.black500, fontSize: 18.sp),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          "الوصف: ${widget.challenge.description}",
                          style: getMediumStyle(
                              color: widget.isSelected?ColorManager.white:ColorManager.black500, fontSize: 16.sp),
                        ),
                        Text(
                          "المهارة: ${widget.challenge.skills}",
                          style: getMediumStyle(
                              color: widget.isSelected?ColorManager.white:ColorManager.black500, fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                  width: 190,
                  height: 45,
                  child: CustomButton(
                    onTap: () {},
                    text: "ابدا الان",
                    textColor: widget.isSelected?ColorManager.primary700:ColorManager.white,
                    color: widget.isSelected?ColorManager.white:ColorManager.primary700,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
