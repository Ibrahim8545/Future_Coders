import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_favourite_books_container.dart';
import 'package:flutter/material.dart';

class BooksFathersTab extends StatelessWidget {
  const BooksFathersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomFavouriteBooksContainer(image: ImageAssets.bookImage,),
          CustomFavouriteBooksContainer(image: ImageAssets.imageBook,),
        ],
      ),
    );
  }
}
