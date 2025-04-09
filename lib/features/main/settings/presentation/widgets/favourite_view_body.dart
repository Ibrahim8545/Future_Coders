import 'package:courseapp/features/main/settings/presentation/views/all_favourites_tab.dart';
import 'package:courseapp/features/main/settings/presentation/views/articles_tab.dart';
import 'package:courseapp/features/main/settings/presentation/views/books_tab.dart';
import 'package:courseapp/features/main/settings/presentation/views/favourite_courses_tab.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_favourite_view_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_tab_bar_widget.dart';

class FavouriteViewBody extends StatefulWidget {
  const FavouriteViewBody({super.key});

  @override
  State<FavouriteViewBody> createState() => _FavouriteViewBodyState();
}

class _FavouriteViewBodyState extends State<FavouriteViewBody>
    with TickerProviderStateMixin {
  final List<Tab> tabs = [
    const Tab(text: "جميع التفضيلات"),
    const Tab(text: "الكورسات"),
    const Tab(text: "الكتب"),
    const Tab(text: "المقالات"),
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
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .09.h),
              child: Column(
                children: [
                  const CustomFavouriteViewAppBar(),
                  CustomTabBarWidget(controller: tabController, tabs: tabs),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: const [
                        AllFavouritesTab(),
                        FavouriteCoursesTab(),
                        BooksTab(),
                        ArticlesTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const CustomAppBar(),
          ],
        ),
      ),
    );
  }
}






