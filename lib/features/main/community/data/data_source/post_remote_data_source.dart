import 'dart:io';
import 'package:courseapp/features/main/community/data/models/post_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class PostRemoteDataSource {
  final SupabaseClient _supabaseClient;

  PostRemoteDataSource(this._supabaseClient);

  Future<PostModel> addPost({required String text, File? image}) async {
    try {
      final currentUser = _supabaseClient.auth.currentUser;
      if (currentUser == null) {
        throw Exception('User not authenticated');
      }

      String imageUrl = '';
      if (image != null) {
        final uuid = const Uuid().v4();
        final imagePath = 'posts/${currentUser.id}/$uuid.jpg';

        await _supabaseClient.storage
            .from('post_images')
            .upload(imagePath, image);

        imageUrl = _supabaseClient.storage
            .from('post_images')
            .getPublicUrl(imagePath);
      }


      final postId = const Uuid().v4();
      final timestamp = DateTime.now().toUtc();

      final postData = {
        'id': postId,
        'user_id': currentUser.id,
        'text': text,
        'image_url': imageUrl,
        'created_at': timestamp.toIso8601String(),
      };

      await _supabaseClient.from('posts').insert(postData);

      return PostModel.fromJson(postData);
    } catch (e) {
      throw Exception('Failed to create post: ${e.toString()}');
    }
  }

  Future<List<PostModel>> getPosts() async {
    try {
      final response = await _supabaseClient
          .from('posts')
          .select()
          .order('created_at', ascending: false);

      return (response as List)
          .map((json) => PostModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch posts: ${e.toString()}');
    }
  }

  Stream<List<PostModel>> postsStream() {
    return _supabaseClient
        .from('posts')
        .stream(primaryKey: ['id'])
        .order('created_at', ascending: false)
        .map((data) => data.map((json) => PostModel.fromJson(json)).toList());
  }
}