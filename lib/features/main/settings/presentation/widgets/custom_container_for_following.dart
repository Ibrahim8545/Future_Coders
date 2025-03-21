import 'package:courseapp/utils/color_manager.dart';
import 'package:courseapp/utils/styles_manager.dart';
import 'package:courseapp/utils/values_manager.dart';
import 'package:flutter/material.dart';

class CustomContainerForFollowing extends StatelessWidget {
  const CustomContainerForFollowing(
      {super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      height: AppSize.s87,
      decoration: BoxDecoration(
        color: ColorManager.secondary100,
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: getSemiBoldStyle(color: ColorManager.black500),
          ),
          const SizedBox(height: AppSize.s12),
          Text(
            subTitle,
            style: getMediumStyle(color: ColorManager.black500),
          ),
        ],
      ),
    );
  }
}
