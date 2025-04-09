import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/components/build_box_decoration.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/core/utils/values_manager.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_favourite_icon.dart';
import 'package:flutter/material.dart';

import 'custom_elevated_button.dart';

class FavouriteCoursesContainer extends StatelessWidget {
  const FavouriteCoursesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppPadding.p16,vertical: AppPadding.p16),
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
      width: double.infinity,
      decoration: buildBoxDecoration(),
      child: Column(
        children: [
          const CustomFavouriteIcon(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "مقدمة الي البرمجة",
                    style: getMediumStyle(
                      color: ColorManager.primary700,
                    ),
                  ),
                   CustomElevatedButton(title: "ابدا الان",onPressed: (){},)
                ],
              ),
              Image.asset(
                ImageAssets.courcesImage,
              ),
            ],
          ),
        ],
      ),
    );
  }


}


