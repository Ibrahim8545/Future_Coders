import 'package:courseapp/features/main/cources/presentation/views/student_performance_tab.dart';
import 'package:courseapp/features/main/cources/presentation/views/student_progress_tab.dart';
import 'package:courseapp/features/main/cources/presentation/widgets/custom_tab_bar_progress_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProgressTabBar extends StatefulWidget {
  CustomProgressTabBar({
    super.key,
    required this.tabs,
    required this.tabController,
  });

  final List<Tab> tabs;
  late TabController tabController;

  @override
  State<CustomProgressTabBar> createState() => _CustomProgressTabBarState();
}

class _CustomProgressTabBarState extends State<CustomProgressTabBar>
    with TickerProviderStateMixin {
  @override
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
          CustomTabBarProgressItem(widget: widget),
          Expanded(
            child: TabBarView(
                controller: widget.tabController,
                children: const [
                  StudentProgressTab(),
                  StudentPerformanceTab()
                ]),
          )
        ],
      ),
    );
  }
}