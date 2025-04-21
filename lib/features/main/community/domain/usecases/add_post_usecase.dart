import 'dart:io';
import 'package:courseapp/features/main/community/data/models/post_model.dart';
import 'package:courseapp/features/main/community/data/repos/post_repository.dart';

class AddPostUseCase {
  final PostRepository repository;

  AddPostUseCase(this.repository);

  Future<PostModel> call({required String text, File? image}) async {
    return await repository.addPost(text: text, image: image);
  }

  Future<List<PostModel>> getPosts() async {
    return await repository.getPosts();
  }

  Stream<List<PostModel>> postsStream() {
    return repository.postsStream();
  }
}