import 'package:courseapp/features/main/settings/presentation/widgets/custom_row_text_widget.dart';
import 'package:courseapp/utils/assets_manager.dart';
import 'package:courseapp/utils/color_manager.dart';
import 'package:courseapp/utils/font_manager.dart';
import 'package:courseapp/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 78.0),
                  child: Text("الاعدادات",
                      style: TextStyle(
                          color: ColorManager.black500,
                          fontSize: 24,
                          fontWeight: FontWeightManager.bold)),
                ),
              ],
            ),
            const SizedBox(height: AppSize.s40),
            CustomRowSettingsWidget(
                iconPath: IconsAssets.settingIcon, title: "الملف الشخصي"),
            CustomRowSettingsWidget(
                iconPath: IconsAssets.editProfile, title: "تعديل الملف الشخضي"),
            CustomRowSettingsWidget(
                iconPath: IconsAssets.favorite, title: "المفضلات"),
            CustomRowSettingsWidget(
                iconPath: IconsAssets.payIcon, title: "الدفع"),
            CustomRowSettingsWidget(
                iconPath: IconsAssets.helpIcon, title: "المساعده والتواصل"),
            CustomRowSettingsWidget(
                iconPath: IconsAssets.logout, title: "تسجيل الخروج"),
          ],
        ),
        Positioned(
          child: Image.asset(
            'assets/images/Mask group.png',
          ),
        )
      ],
    );
  }
}
