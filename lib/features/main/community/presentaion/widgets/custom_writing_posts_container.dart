import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomWritingPostsContainer extends StatelessWidget {
  const CustomWritingPostsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.publishPosts);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 50.h,
          decoration: ShapeDecoration(
            color: ColorManager.white,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            children: [
              Icon(
                Icons.edit,
                color: ColorManager.primary700,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "اكتب هنا....",
                style:
                getMediumStyle(color: ColorManager.black500, fontSize: 14),
              ),
              const Spacer(),
              Icon(
                Icons.mic_rounded,
                color: ColorManager.primary700,
              )
            ],
          ),
        ),
      ),
    );
  }
}