import 'package:courseapp/features/main/settings/presentation/widgets/custom_favourite_courses_container.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_row_text_favourite_view.dart';
import 'package:flutter/material.dart';

class FavouriteCoursesTab extends StatelessWidget {
  const FavouriteCoursesTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomRowTextFavouriteView(title: 'الكورسات'),
          FavouriteCoursesContainer(),
        ],
      ),
    );
  }
}
