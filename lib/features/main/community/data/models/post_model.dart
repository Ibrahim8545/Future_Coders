class Post {
  final String id;
  final String userName;
  final String text;
  final String? imageUrl;
  final DateTime createdAt;

  Post({
    required this.id,
    required this.userName,
    required this.text,
    this.imageUrl,
    required this.createdAt,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      userName: map['userName'],
      text: map['text'],
      imageUrl: map['imageUrl'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'text': text,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}