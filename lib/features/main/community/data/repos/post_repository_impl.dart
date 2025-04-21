import 'dart:io';
import 'package:courseapp/features/main/community/data/data_source/post_remote_data_source.dart';
import 'package:courseapp/features/main/community/data/models/post_model.dart';
import 'package:courseapp/features/main/community/data/repos/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource _postRemoteDataSource;

  PostRepositoryImpl(this._postRemoteDataSource);

  @override
  Future<PostModel> addPost({required String text, File? image}) async {
    return await _postRemoteDataSource.addPost(text: text, image: image);
  }

  @override
  Future<List<PostModel>> getPosts() async {
    return await _postRemoteDataSource.getPosts();
  }

  @override
  Stream<List<PostModel>> postsStream() {
    return _postRemoteDataSource.postsStream();
  }
}