import 'package:courseapp/features/main/community/data/models/post_model.dart';
import 'package:equatable/equatable.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object?> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostCreationSuccess extends PostState {
  final PostModel post;

  const PostCreationSuccess(this.post);

  @override
  List<Object?> get props => [post];
}

class PostCreationFailure extends PostState {
  final String message;

  const PostCreationFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class PostListUpdated extends PostState {
  final List<PostModel> posts;

  const PostListUpdated(this.posts);

  @override
  List<Object?> get props => [posts];
}

class PostsLoadFailure extends PostState {
  final String message;

  const PostsLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}