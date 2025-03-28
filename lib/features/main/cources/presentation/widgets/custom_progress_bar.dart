import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';

class CustomCourseProgressBar extends StatelessWidget {
  const CustomCourseProgressBar({
    super.key, required this.rate, required this.width,
  });
  final String rate;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            rate,
            style: getSemiBoldStyle(
              color: ColorManager.secondary600,
              fontSize: 12,
            ),
          ),
          Container(
            width: double.infinity,
            height: 7,
            decoration: ShapeDecoration(
              color: ColorManager.secondary100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.50),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: width,
                  height: 7,
                  decoration: ShapeDecoration(
                    color: ColorManager.secondary400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
