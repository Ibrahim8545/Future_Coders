import 'package:courseapp/core/utils/values_manager.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_buttom.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_circle_avatar_profile_photo.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_profile_name_widget.dart';
import 'package:flutter/material.dart';
import 'custom_app_bar_title.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomRowAppBarTitle(
              title: "تعديل الملف الشخضي",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
            ),
            const CustomCircleAvatarProfilePhoto(),
            const SizedBox(height: AppSize.s24),
            const CustomProfileNameWidget(),
            const SizedBox(height: AppSize.s40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
              child: CustomButton(
                color: const Color(0xff0A638F),
                onTap: () {},
                text: "البريد الالكتروني",
              ),
            ),
            const SizedBox(height: AppSize.s12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
              child: CustomButton(
                  color: const Color(0xff0A638F),
                  onTap: () {},
                  text: "كلمه المرور"),
            ),
          ],
        ),
        const CustomAppBar(),
      ],
    );
  }
}
