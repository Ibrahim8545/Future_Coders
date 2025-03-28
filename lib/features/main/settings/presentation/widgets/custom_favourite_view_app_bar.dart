import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class CustomFavouriteViewAppBar extends StatelessWidget {
  const CustomFavouriteViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: MediaQuery.of(context).size.width*.11,),
        Text(
          textAlign: TextAlign.center,
          "التفضيلات",
          style: getBoldStyle(color: ColorManager.black500),
        ),
        Padding(
          padding: const EdgeInsets.only(right:AppPadding.p12),
          child: Icon(Icons.delete,color: ColorManager.red600),
        ),
      ],
    );
  }
}