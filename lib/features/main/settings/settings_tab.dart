import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
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
                    return const CustomLogOutAlertDialog();
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

class CustomLogOutAlertDialog extends StatelessWidget {
  const CustomLogOutAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorManager.white,
      title: Stack(
        alignment: Alignment.center,
          children: [
        Image.asset(ImageAssets.redImg),
        Image.asset(ImageAssets.exit),
      ]),
      content: Text(
        "هل أنت متأكد أنك ترغب في الخروج؟",
        style: getMediumStyle(color: ColorManager.black500),
        textAlign: TextAlign.center,
      ),
      actions: [
        Directionality(
          textDirection:TextDirection.rtl,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.signIn);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffDD3434),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      )),
                  child: Text(
                    "تأكيد",
                    style:
                        getMediumStyle(color: ColorManager.white),
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(4),
                            side: const BorderSide(
                                color: Color(0xffDD3434)))),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("إلغاء",
                        style: getMediumStyle(
                            color: ColorManager.black500))),
              )
            ],
          ),
        )
      ],
    );
  }
}
