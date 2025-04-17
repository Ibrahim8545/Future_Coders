import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/components/build_box_decoration.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPaymentDetailsContainer extends StatelessWidget {
  const CustomPaymentDetailsContainer(
      {super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.h),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: buildBoxDecoration(width: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: getMediumStyle(color: ColorManager.grey1),
              ),
              Text(
                subTitle,
                style: getMediumStyle(color: ColorManager.black500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}