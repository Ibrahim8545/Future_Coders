import 'package:courseapp/features/main/community/presentaion/widgets/custom_channels_container.dart';
import 'package:courseapp/features/main/community/presentaion/widgets/custom_future_event_container.dart';
import 'package:courseapp/features/main/community/presentaion/widgets/custom_questions_container.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_row_text_favourite_view.dart';
import 'package:flutter/material.dart';

class AllPostsTab extends StatefulWidget {
  const AllPostsTab({super.key});

  @override
  State<AllPostsTab> createState() => _AllPostsTabState();
}

class _AllPostsTabState extends State<AllPostsTab> {
  bool isFollowing = false;
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Column(
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomQuestionsContainer(),
              ),
            ),
            CustomRowTextFavouriteView(title: "الأحداث القادمة"),
            CustomFutureEventContainer(),
            CustomRowTextFavouriteView(title: "القنوات"),
            CustomChannelsContainer(),
          ],
        ),
      ),
    );
  }
}


