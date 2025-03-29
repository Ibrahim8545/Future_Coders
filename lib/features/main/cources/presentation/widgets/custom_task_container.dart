import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/components/build_box_decoration.dart';
import 'package:courseapp/core/utils/components/build_text.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/core/utils/values_manager.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTaskContainer extends StatelessWidget {
  CustomTaskContainer({super.key, required this.subTitle, this.code, required this.image});

  final String subTitle;
  final String image;
  String? code;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildBoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
          vertical: AppPadding.p16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildText(
                textDirection: TextDirection.rtl,
                title: "المهام الاول:",
                color: ColorManager.black500,
                size: 20.sp),
            Text(
              textAlign: TextAlign.start,
              textDirection: TextDirection.rtl,
              subTitle,
              style:
              getMediumStyle(color: ColorManager.black500, fontSize: 16.sp),
            ),
            buildText(
                textDirection: TextDirection.rtl,
                title: "الكود:", color: ColorManager.black500, size: 20.sp),
            buildText(
              textDirection: TextDirection.ltr,
              title: code ?? "",
              color: ColorManager.black600,
              size: 12.sp,
            ),
            Image.asset(
              image,
            ),
            buildText(
                textDirection: TextDirection.rtl,
                title: "اجابتك:", color: ColorManager.black500, size: 20.sp),
            SizedBox(
              height: AppSize.s16.h,
            ),
            CustomTextField(
              maxLines: 5,
              text: "الرجاء ادخل اجابتك",
              hint: "اجابتك",
            )
          ],
        ),
      ),
    );
  }


}