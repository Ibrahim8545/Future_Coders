import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';

Text buildText(
    {required String title,
      required Color color,
      double? size,
      required TextDirection textDirection}) {
  return Text(
    textAlign: TextAlign.start,
    title,
    style: getBoldStyle(color: color, fontSize: size ?? 20),
    textDirection: textDirection,
  );
}