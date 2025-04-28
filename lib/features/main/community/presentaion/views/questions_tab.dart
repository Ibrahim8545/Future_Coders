import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/main/community/presentaion/manager/post_provider.dart';
import 'package:courseapp/features/main/community/presentaion/views/publish_posts_view.dart';
import 'package:courseapp/features/main/community/presentaion/widgets/custom_questions_container.dart';
import 'package:courseapp/features/main/community/presentaion/widgets/custom_writing_posts_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionsTab extends StatefulWidget {
  const QuestionsTab({super.key});

  @override
  State<QuestionsTab> createState() => _QuestionsTabState();
}

class _QuestionsTabState extends State<QuestionsTab> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PublishPostsView(),
                  ),
                );
              },
              child: const CustomWritingPostsContainer(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Consumer<PostsProvider>(
                builder: (context, postsProvider, child) {
                  final posts = postsProvider.posts;

                  if (posts.isEmpty) {
                    return Center(
                      child: Text(
                        'لا توجد منشورات بعد',
                        style: getMediumStyle(color: ColorManager.grey400),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: CustomQuestionsContainer(
                          post: posts[index],
                          onDelete: () {
                            postsProvider.deletePost(posts[index].id);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}