import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressStats extends StatelessWidget {
  const ProgressStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            _buildStatRow("الدقة", 0.9, Colors.green, Colors.green.shade100),
            _buildStatRow("السرعة", 0.5, Colors.red, Colors.red.shade100),
            _buildStatRow("المشاهدة", 0.7, Colors.amber, Colors.amber.shade100),
            _buildStatRow("الاجابات", 0.5, Colors.amber, Colors.amber.shade100),
            _buildStatRow("الانجاز", 1.0, Colors.green, Colors.green.shade100),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(
      String label,
      double value,
      Color activeColor,
      Color backgroundColor,
      ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 10.h,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                FractionallySizedBox(
                  alignment: Alignment.centerRight,
                  widthFactor: value,
                  child: Container(
                    height: 10.h,
                    decoration: BoxDecoration(
                      color: activeColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Text(
            label,
            style: getMediumStyle(color: ColorManager.black500,fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}


