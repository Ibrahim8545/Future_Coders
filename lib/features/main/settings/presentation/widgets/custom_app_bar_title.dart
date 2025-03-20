import 'package:courseapp/utils/color_manager.dart';
import 'package:courseapp/utils/styles_manager.dart';
import 'package:flutter/material.dart';

class CustomRowAppBarTitle extends StatelessWidget {
  const CustomRowAppBarTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 78.0),
          child: Text(title, style: getBoldStyle(color: ColorManager.black700)),
        ),
      ],
    );
  }
}
