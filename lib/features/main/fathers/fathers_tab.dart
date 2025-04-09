import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/features/main/fathers/presentaion/views/articles_fathers_tab.dart';
import 'package:courseapp/features/main/fathers/presentaion/views/books_fathers_tab.dart';
import 'package:courseapp/features/main/fathers/presentaion/views/how_to_work_tab.dart';
import 'package:courseapp/features/main/fathers/presentaion/views/popular_questions_tab.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar_title.dart';
import 'package:flutter/material.dart';
import '../settings/presentation/widgets/custom_tab_bar_widget.dart';

class FathersTab extends StatefulWidget {
  const FathersTab({super.key});

  @override
  State<FathersTab> createState() => _FavouriteViewBodyState();
}

class _FavouriteViewBodyState extends State<FathersTab>
    with TickerProviderStateMixin {
  final List<Tab> tabs = [
    const Tab(text: "المقالات"),
    const Tab(text: "الكتب"),
    const Tab(text: "كيف يعمل التطبيق"),
    const Tab(text: "الاسئلة الأكثر شيوعا"),
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
                const CustomRowAppBarTitle(title: "الاباء"),
                CustomTabBarWidget(controller: tabController, tabs: tabs),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: const [
                      ArticlesFathersTab(),
                      BooksFathersTab(),
                      HowToWorkTab(),
                      PopularQuestionsTab(),
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
