import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/values_manager.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_row_text_and_icon_settings.dart';
import 'package:flutter/material.dart';

class CustomRowSettingsWidget extends StatelessWidget {
  const CustomRowSettingsWidget(
      {super.key, required this.title, required this.iconPath});

  final String title;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSize.s20, vertical: AppSize.s12),
      child: Container(
        height: AppSize.s50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ColorManager.primary700),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomRowTextAndIconSettings(
            title: title,
            iconPath: iconPath,
          ),
        ),
      ),
    );
  }
}
