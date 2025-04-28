import 'package:courseapp/features/main/community/presentaion/manager/post_provider.dart';
import 'package:courseapp/features/main/community/presentaion/widgets/custom_channels_container.dart';
import 'package:courseapp/features/main/community/presentaion/widgets/custom_future_event_container.dart';
import 'package:courseapp/features/main/community/presentaion/widgets/custom_questions_container.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_row_text_favourite_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Column(
          children: [
            Consumer<PostsProvider>(
              builder: (context, postsProvider, child) {
                final posts = postsProvider.posts;

                return Column(
                  children: [
                    for (final post in posts)
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomQuestionsContainer(
                            post: post,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
            const CustomRowTextFavouriteView(title: "الأحداث القادمة"),
            const CustomFutureEventContainer(),
            const CustomRowTextFavouriteView(title: "القنوات"),
            const CustomChannelsContainer(),
          ],
        ),
      ),
    );
  }
}