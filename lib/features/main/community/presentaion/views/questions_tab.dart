import 'package:courseapp/features/main/community/data/data_source/post_remote_data_source.dart';
import 'package:courseapp/features/main/community/data/repos/post_repository_impl.dart';
import 'package:courseapp/features/main/community/domain/usecases/add_post_usecase.dart';
import 'package:courseapp/features/main/community/presentaion/manager/post_cubit.dart';
import 'package:courseapp/features/main/community/presentaion/manager/post_state.dart';
import 'package:courseapp/features/main/community/presentaion/widgets/custom_questions_container.dart';
import 'package:courseapp/features/main/community/presentaion/widgets/custom_writing_posts_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class QuestionsTab extends StatefulWidget {
  const QuestionsTab({super.key});

  @override
  State<QuestionsTab> createState() => _QuestionsTabState();
}

class _QuestionsTabState extends State<QuestionsTab> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(
        AddPostUseCase(
          PostRepositoryImpl(
            PostRemoteDataSource(Supabase.instance.client),
          ),
        ),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const CustomWritingPostsContainer(),
              Expanded(
                child: BlocBuilder<PostCubit, PostState>(
                  builder: (context, state) {
                    if (state is PostListUpdated) {
                      if (state.posts.isEmpty) {
                        return const Center(
                          child: Text('لا توجد منشورات بعد'),
                        );
                      }
                      return RefreshIndicator(
                        onRefresh: () => context.read<PostCubit>().fetchPosts(),
                        child: ListView.builder(
                          itemCount: state.posts.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: CustomQuestionsContainer(
                                post: state.posts[index],
                              ),
                            );
                          },
                        ),
                      );
                    } else if (state is PostsLoadFailure) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(state.message),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () => context.read<PostCubit>().fetchPosts(),
                              child: const Text('إعادة المحاولة'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}