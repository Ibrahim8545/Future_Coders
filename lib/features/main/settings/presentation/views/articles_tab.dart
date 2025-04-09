import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_favourite_article_container.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_row_text_favourite_view.dart';
import 'package:flutter/material.dart';

class ArticlesTab extends StatelessWidget {
  const ArticlesTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomRowTextFavouriteView(title: 'المقالات'),
          CustomFavouriteArticleContainer(image: ImageAssets.imageArticleTwo,),
        ],
      ),
    );
  }
}