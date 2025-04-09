import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/features/main/community/presentaion/views/all_posts_tab.dart';
import 'package:courseapp/features/main/community/presentaion/views/channels_tab.dart';
import 'package:courseapp/features/main/community/presentaion/views/events_tab.dart';
import 'package:courseapp/features/main/community/presentaion/views/questions_tab.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar_title.dart';
import 'package:flutter/material.dart';
import '../settings/presentation/widgets/custom_tab_bar_widget.dart';

class CommunityTab extends StatefulWidget {
  const CommunityTab({super.key});

  @override
  State<CommunityTab> createState() => _FavouriteViewBodyState();
}

class _FavouriteViewBodyState extends State<CommunityTab>
    with TickerProviderStateMixin {
  final List<Tab> tabs = [
    const Tab(text: "جميع المنشورات"),
    const Tab(text: "الاسئلة"),
    const Tab(text: "الأحداث"),
    const Tab(text: "القنوات"),
  ];
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                const CustomRowAppBarTitle(title: "المجتمع"),
                CustomTabBarWidget(controller: tabController, tabs: tabs),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: const [
                      AllPostsTab(),
                      QuestionsTab(),
                      EventsTab(),
                      ChannelsTab(),
                    ],
                  ),
                ),
              ],
            ),
            Image.asset(ImageAssets.curveImage)
          ],
        ),
      ),
    );
  }
}

