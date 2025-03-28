import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/features/main/cources/presentation/widgets/custom_tab_bar_widget.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar_title.dart';
import 'package:flutter/material.dart';

class CoursesTab extends StatefulWidget {
  const CoursesTab({super.key});

  @override
  State<CoursesTab> createState() => _CoursesTabState();
}

class _CoursesTabState extends State<CoursesTab> with TickerProviderStateMixin {
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

  final List<Tab> tabs = [
    const Tab(text: "الغير مكتملة"),
    const Tab(text: "المكتملة"),
    const Tab(text: "المهام"),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const CustomRowAppBarTitle(title: "كورساتى"),
            Expanded(
              child: CustomTabBarWidget(
                tabs: tabs,
                tabController: tabController,
              ),
            )
          ],
        ),
        Image.asset(ImageAssets.curveImage)
      ],
    );
  }
}



