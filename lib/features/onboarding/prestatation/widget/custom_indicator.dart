import 'package:courseapp/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomIndicator extends StatelessWidget {
  final PageController controller;
  final int count;

  const CustomIndicator({
    super.key,
    required this.controller,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect: ExpandingDotsEffect(
        dotColor: ColorManager.primary500,
        activeDotColor: ColorManager.primary700,
        dotHeight: 10,
        dotWidth: 10,
      ),
    );
  }
}
