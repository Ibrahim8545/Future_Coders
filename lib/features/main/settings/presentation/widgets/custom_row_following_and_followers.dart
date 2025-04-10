import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'custom_container_for_following.dart';

class CustomRowFollowingAndFollowers extends StatelessWidget {
  const CustomRowFollowingAndFollowers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  const EdgeInsets.symmetric(horizontal: AppPadding.p20,vertical: AppPadding.p14),
      child: Row(
        children: [
          Expanded(child: CustomContainerForFollowing(title: 'المتابعين', subTitle: '10',color: ColorManager.secondary100,)),
          const SizedBox(width: 8),
          Expanded(child: CustomContainerForFollowing(title: 'المتابعون', subTitle: '100',color: ColorManager.primary100,)),
        ],
      ),
    );
  }
}