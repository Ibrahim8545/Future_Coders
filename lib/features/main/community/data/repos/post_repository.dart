import 'dart:io';
import 'package:courseapp/features/main/community/data/models/post_model.dart';

abstract class PostRepository {
  Future<PostModel> addPost({required String text, File? image});
  Future<List<PostModel>> getPosts();
  Stream<List<PostModel>> postsStream();
}