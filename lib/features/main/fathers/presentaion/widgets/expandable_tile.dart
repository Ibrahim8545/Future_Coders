
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandableTile extends StatefulWidget {
  final String title;
  final String? description;

  const ExpandableTile({
    super.key,
    required this.title,
    this.description,
  });

  @override
  State<ExpandableTile> createState() => _ExpandableTileState();
}

class _ExpandableTileState extends State<ExpandableTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title Container
        GestureDetector(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              border: Border.all(color: ColorManager.primary700, width: 2.w),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      maxLines: 2,
                      style: getMediumStyle(
                        color: ColorManager.primary700,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    isExpanded ? Icons.remove : Icons.add,
                    color: isExpanded ? Colors.red : ColorManager.primary700,
                    size: 24.sp,
                  ),
                ],
              ),
            ),
          ),
        ),

        // Description Container
        if (isExpanded && widget.description != null)
          Container(
            margin: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              bottom: 10.h,
            ),
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              border: Border.all(color: ColorManager.primary700, width: 2.w),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              widget.description!,
              textDirection: TextDirection.rtl,
              style: getMediumStyle(
                color: ColorManager.black500,
                fontSize: 16.sp,
              ),
            ),
          ),
      ],
    );
  }
}

