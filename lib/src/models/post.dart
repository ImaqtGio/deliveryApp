class PostObject {
  PostObject({
    required this.image,
    required this.title,
    required this.likes,
    required this.id,
  });

  String image;
  String title;
  int likes;
  int id;

  static PostObject fromJson(Map<String, dynamic>? json) {
    return PostObject(
      image: json?['image'],
      title: json?['title'],
      likes: json?['likes'],
      id: json?['id'],
    );
  }
}
