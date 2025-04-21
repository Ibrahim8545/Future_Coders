import 'dart:async';
import 'dart:io';
import 'package:courseapp/features/main/community/domain/usecases/add_post_usecase.dart';
import 'package:courseapp/features/main/community/presentaion/manager/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  final AddPostUseCase _addPostUseCase;
  StreamSubscription? _postsSubscription;

  PostCubit(this._addPostUseCase) : super(PostInitial()) {
    fetchPosts();
    startPostsRealTimeUpdates();
  }

  Future<void> addPost({required String text, File? image}) async {
    emit(PostLoading());
    try {
      final post = await _addPostUseCase(text: text, image: image);
      emit(PostCreationSuccess(post));
      fetchPosts();
    } catch (e) {
      emit(PostCreationFailure(e.toString()));
    }
  }

  Future<void> fetchPosts() async {
    try {
      final posts = await _addPostUseCase.getPosts();
      emit(PostListUpdated(posts));
    } catch (e) {
      emit(PostsLoadFailure(e.toString()));
    }
  }

  void startPostsRealTimeUpdates() {
    _postsSubscription?.cancel();
    _postsSubscription = _addPostUseCase.postsStream().listen(
          (posts) {
        emit(PostListUpdated(posts));
      },
      onError: (error) {
        emit(PostsLoadFailure(error.toString()));
      },
    );
  }

  @override
  Future<void> close() {
    _postsSubscription?.cancel();
    return super.close();
  }
}