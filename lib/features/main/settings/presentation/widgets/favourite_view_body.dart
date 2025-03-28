import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_favourite_view_app_bar.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_row_text_favourite_view.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_favourite_article_container.dart';
import 'custom_favourite_books_container.dart';
import 'custom_favourite_courses_container.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .09.h,
              ),
              const CustomFavouriteViewAppBar(),
              const CustomTabBarWidget(),
              const CustomRowTextFavouriteView(
                title: 'الكورسات',
              ),
              const FavouriteCoursesContainer(),
              const CustomRowTextFavouriteView(
                title: 'المقالات',
              ),
              const CustomFavouriteArticleContainer(),
              const CustomRowTextFavouriteView(
                title: 'الكتب',
              ),
              const CustomFavouriteBooksContainer()
            ],
          ),
          const CustomAppBar(),
        ],
      ),
    );
  }
}

