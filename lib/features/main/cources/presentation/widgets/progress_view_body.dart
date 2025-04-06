import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/core/utils/values_manager.dart';
import 'package:courseapp/features/main/cources/presentation/widgets/cutsom_progress_tab_bar.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressViewBody extends StatefulWidget {
  const ProgressViewBody({
    super.key,
  });

  @override
  State<ProgressViewBody> createState() => _ProgressViewBodyState();
}

class _ProgressViewBodyState extends State<ProgressViewBody>
    with TickerProviderStateMixin {
  List<Tab> tabs = [
    const Tab(text: "التقدم"),
    const Tab(text: "الاداء"),
  ];

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Column(
              children: [
                const CustomRowAppBarTitle(title: "تقدم الطالب"),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorManager.secondary300,
                          borderRadius: BorderRadius.circular(AppSize.s8.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 18),
                                child: Text(
                                  "مجهود رائع!",
                                  textDirection: TextDirection.rtl,
                                  style: getMediumStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 18),
                                child: Text(
                                  "تابع اكمال دروسك لتطوير مهاراتك فى\nعالم البرمجة",
                                  textDirection: TextDirection.rtl,
                                  style: getMediumStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 18.w,
                          ),
                          Image.asset(
                            ImageAssets.womanCelebrating,
                            height: 200.h,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                CustomProgressTabBar(tabs: tabs, tabController: tabController)
              ],
            ),
            const CustomAppBar()
          ],
        ),
      ],
    );
  }
}



