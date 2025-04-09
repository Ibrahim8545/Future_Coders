import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_favourite_article_container.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_favourite_books_container.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_favourite_courses_container.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_row_text_favourite_view.dart';
import 'package:flutter/material.dart';

class AllFavouritesTab extends StatefulWidget {
  const AllFavouritesTab({
    super.key,
  });

  @override
  State<AllFavouritesTab> createState() => _AllFavouritesTabState();
}

class _AllFavouritesTabState extends State<AllFavouritesTab> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomRowTextFavouriteView(title: 'الكورسات'),
          FavouriteCoursesContainer(),
          CustomRowTextFavouriteView(title: 'المقالات'),
          CustomFavouriteArticleContainer(image: ImageAssets.articleImage,),
          CustomRowTextFavouriteView(title: 'الكتب'),
          CustomFavouriteBooksContainer(image: ImageAssets.bookImage,),
        ],
      ),
    );
  }
}
