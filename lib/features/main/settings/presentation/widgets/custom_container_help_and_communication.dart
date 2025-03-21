import 'package:courseapp/utils/color_manager.dart';
import 'package:courseapp/utils/styles_manager.dart';
import 'package:courseapp/utils/values_manager.dart';
import 'package:flutter/material.dart';

class CustomContainerHelpAndCommunication extends StatelessWidget {
  const CustomContainerHelpAndCommunication({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:AppPadding.p20,vertical: AppPadding.p12),
      child: Container(
        alignment: Alignment.centerRight,
        width: double.infinity,
        height: AppSize.s50,
        decoration: BoxDecoration(
            color: ColorManager.primary700,
            borderRadius: BorderRadius.circular(AppSize.s8)),
        child: Padding(
          padding: const EdgeInsets.only(right:AppPadding.p12),
          child: Text(
            title,
            style: getBoldStyle(
              color: ColorManager.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
