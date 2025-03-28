import 'package:courseapp/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

BoxDecoration buildBoxDecoration({Color? color,double? width}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: ColorManager.primary700, width: width??2),
  );
}