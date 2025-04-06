import 'package:courseapp/features/main/cources/presentation/views/courses_complete_tab.dart';
import 'package:courseapp/features/main/cources/presentation/views/courses_not_complete_tab.dart';
import 'package:courseapp/features/main/cources/presentation/views/tasks_tab.dart';
import 'package:courseapp/features/main/cources/presentation/widgets/custom_tab_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBarWidget extends StatefulWidget {
  CustomTabBarWidget({
    super.key,
    required this.tabs,
    required this.tabController,
  });

  final List<Tab> tabs;
  late TabController tabController;

  @override
  State<CustomTabBarWidget> createState() => _CustomTabBarWidgetState();
}

class _CustomTabBarWidgetState extends State<CustomTabBarWidget>
    with TickerProviderStateMixin {
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
          CustomTabBarItem(widget: widget),
          Expanded(
              child: TabBarView(
                  controller: widget.tabController,
                  children: const [
                    CoursesNotCompleteTab(),
                    CoursesCompleteTab(),
                    TasksTab()
                  ]))
        ],
      ),
    );
  }
}