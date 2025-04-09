import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_favourite_article_container.dart';
import 'package:flutter/material.dart';

class ArticlesFathersTab extends StatelessWidget {
  const ArticlesFathersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SingleChildScrollView(
      child:  Column(
        children: [
          CustomFavouriteArticleContainer(image: ImageAssets.articleImage,),
          CustomFavouriteArticleContainer(image: ImageAssets.imageArticleTwo,),
        ],
      ),
    );
  }
}
