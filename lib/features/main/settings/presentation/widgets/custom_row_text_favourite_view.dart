import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class CustomRowTextFavouriteView extends StatelessWidget {
  const CustomRowTextFavouriteView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: getMediumStyle(color: ColorManager.black500),
            ),
            Row(
              children: [
                Text("المزيد",
                    style: getMediumStyle(color: ColorManager.black500,fontSize: 16)),
                const SizedBox(width: AppSize.s4,),
                Icon(
                  size: 20,
                  Icons.arrow_forward_rounded,
                  color: ColorManager.primary700,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
