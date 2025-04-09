import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/core/utils/values_manager.dart';
import 'package:courseapp/features/main/fathers/presentaion/views/articles_fathers_tab.dart';
import 'package:courseapp/features/main/fathers/presentaion/views/books_fathers_tab.dart';
import 'package:courseapp/features/main/fathers/presentaion/views/how_to_work_tab.dart';
import 'package:courseapp/features/main/fathers/presentaion/views/popular_questions_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFathersTabBar extends StatefulWidget {
   CustomFathersTabBar({super.key, required this.tabs,required this.tabController});
  final List<Tab> tabs;
  late TabController tabController;
  @override
  State<CustomFathersTabBar> createState() => _CustomFathersTabBarState();
}

class _CustomFathersTabBarState extends State<CustomFathersTabBar> with TickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
    widget.tabController =
        TabController(length: widget.tabs.length, vsync: this);
  }
  @override
  void dispose() {
    super.dispose();
    widget.tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height.h,
      child: Column(
        children: [
          buildCustomTabBarItemContainer(context),
          Expanded(
              child: TabBarView(
                  controller: widget.tabController,
                  children: const [
                    ArticlesFathersTab(),
                    BooksFathersTab(),
                    HowToWorkTab(),
                    PopularQuestionsTab(),
                  ]))
        ],
      ),
    );
  }

  Container buildCustomTabBarItemContainer(BuildContext context) {
    return Container(
          margin: const EdgeInsets.only(top:AppPadding.p20,left: AppPadding.p16,right: AppPadding.p16),
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
                    labelPadding: const EdgeInsets.all(3),
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
