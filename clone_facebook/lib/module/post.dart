class Post {
  final String id;
  final String idPost;
  final List images;
  String? bio;
  final List likes;
  final DateTime datePost;
  final String name;
  final String avatar;
  Post({
    required this.id,
    required this.idPost,
    required this.bio,
    required this.images,
    required this.likes,
    required this.datePost,
    required this.avatar,
    required this.name,
  });

  set setBio(String _bio) => bio = _bio;

  factory Post.formJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      idPost: json['idPost'],
      bio: json['bio'],
      images: json['images'],
      likes: json['likes'],
      datePost: json['datePost'].toDate(),
      avatar: json['avatar'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idPost': idPost,
      'images': images,
      'bio': bio,
      'likes': likes,
      'datePost': datePost,
      'avatar': avatar,
      'name': name,
    };
  }
}
