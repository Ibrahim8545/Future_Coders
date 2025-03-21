import 'package:courseapp/utils/color_manager.dart';
import 'package:courseapp/utils/styles_manager.dart';
import 'package:flutter/material.dart';

class CustomProfileNameWidget extends StatelessWidget {
  const CustomProfileNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "اميرة محمد ",
          style: getBoldStyle(
            color: ColorManager.black500,
          ),
        ),
        Icon(Icons.edit,color: ColorManager.primary700,)
      ],
    );
  }
}
