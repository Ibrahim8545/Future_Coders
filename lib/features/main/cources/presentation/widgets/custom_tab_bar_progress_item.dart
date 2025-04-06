import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cutsom_progress_tab_bar.dart';

class CustomTabBarProgressItem extends StatelessWidget {
  const CustomTabBarProgressItem({
    super.key,
    required this.widget,
  });

  final CustomProgressTabBar widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppPadding.p20),
      width: MediaQuery.of(context).size.width.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s12.r),
        color: ColorManager.primary100,
      ),
      child: Column(
        children: [
          Directionality(
            textDirection:TextDirection.rtl,
            child: TabBar(
                controller: widget.tabController,
                indicatorWeight: 2,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                labelStyle: getMediumStyle(color: ColorManager.black500,fontSize: AppSize.s20.sp),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: ColorManager.primary700,
                  borderRadius: BorderRadius.circular(12),
                ),
                unselectedLabelStyle:
                getMediumStyle(color: ColorManager.white,fontSize: AppSize.s14.sp),
                tabs: widget.tabs),
          ),
        ],
      ),
    );
  }
}
