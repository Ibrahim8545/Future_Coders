import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/components/custom_log_out_alert_dialog.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/core/utils/values_manager.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar_title.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_row_text_widget.dart';
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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.favView);
              },
              child: CustomRowSettingsWidget(
                  iconPath: IconsAssets.favorite, title: "المفضلات"),
            ),
            CustomRowSettingsWidget(
                iconPath: IconsAssets.payIcon, title: "الدفع"),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.helpView);
              },
              child: CustomRowSettingsWidget(
                  iconPath: IconsAssets.helpIcon, title: "المساعده والتواصل"),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const CustomLogOutAlertDialog(content: "هل أنت متأكد أنك ترغب في الخروج؟",);
                  },
                );
              },
              child: CustomRowSettingsWidget(
                iconPath: IconsAssets.logout,
                title: "تسجيل الخروج",
              ),
            ),
          ],
        ),
        Positioned(
          child: Image.asset(ImageAssets.curveImage),
        ),
      ],
    );
  }
}

