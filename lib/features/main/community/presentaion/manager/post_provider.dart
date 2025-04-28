import 'dart:io';
import 'package:courseapp/features/main/community/data/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class PostsProvider with ChangeNotifier {

  List<Post> _posts = [];

  List<Post> get posts => [..._posts];

  Future<void> addPost(String text, File? image) async {
    String? imageUrl;

    if (image != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = '${const Uuid().v4()}${path.extension(image.path)}';
      final savedImage = await image.copy('${appDir.path}/$fileName');
      imageUrl = savedImage.path;
    }

    final newPost = Post(
      id: const Uuid().v4(),
      userName:"Unknown user", // Hard-coded for now
      text: text,
      imageUrl: imageUrl,
      createdAt: DateTime.now(),
    );

    _posts.add(newPost);
    notifyListeners();
  }

  void deletePost(String id) {
    _posts.removeWhere((post) => post.id == id);
    notifyListeners();
  }
}