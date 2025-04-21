import 'package:courseapp/features/main/community/data/data_source/post_remote_data_source.dart';
import 'package:courseapp/features/main/community/data/repos/post_repository_impl.dart';
import 'package:courseapp/features/main/community/domain/usecases/add_post_usecase.dart';
import 'package:courseapp/features/main/community/presentaion/manager/post_cubit.dart';
import 'package:courseapp/features/main/community/presentaion/manager/post_state.dart';
import 'package:courseapp/features/main/community/presentaion/widgets/custom_channels_container.dart';
import 'package:courseapp/features/main/community/presentaion/widgets/custom_future_event_container.dart';
import 'package:courseapp/features/main/community/presentaion/widgets/custom_questions_container.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_row_text_favourite_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
    return BlocProvider(
      create: (context) => PostCubit(
        AddPostUseCase(
          PostRepositoryImpl(
            PostRemoteDataSource(Supabase.instance.client),
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<PostCubit, PostState>(
                    builder: (context, state) {
                      if (state is PostListUpdated && state.posts.isNotEmpty) {
                        // Display the first post in the list
                        return CustomQuestionsContainer(post: state.posts.first);
                      } else if (state is PostsLoadFailure) {
                        return Center(child: Text('فشل في تحميل المنشورات: ${state.message}'));
                      } else if (state is PostListUpdated && state.posts.isEmpty) {
                        return const Center(child: Text('لا توجد منشورات بعد'));
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
              const CustomRowTextFavouriteView(title: "الأحداث القادمة"),
              const CustomFutureEventContainer(),
              const CustomRowTextFavouriteView(title: "القنوات"),
              const CustomChannelsContainer(),
            ],
          ),
        ),
      ),
    );
  }
}