import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar_title.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_row_text_widget.dart';
import 'package:courseapp/utils/assets_manager.dart';
import 'package:courseapp/utils/values_manager.dart';
import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const CustomRowAppBarTitle(
              title: "الاعدادات",
            ),
            const SizedBox(height: AppSize.s40),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.profileView);
              },
              child: CustomRowSettingsWidget(
                  iconPath: IconsAssets.settingIcon, title: "الملف الشخصي"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.editProfileView);
              },
              child: CustomRowSettingsWidget(
                  iconPath: IconsAssets.editProfile,
                  title: "تعديل الملف الشخضي"),
            ),
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
          child: Image.asset(ImageAssets.curveImage),
        ),
      ],
    );
  }
}
