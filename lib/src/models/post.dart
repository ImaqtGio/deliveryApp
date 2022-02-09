class PostObject {
  PostObject({
    required this.image,
    required this.title,
    required this.likes,
    required this.subtitle,
    required this.id,
  });

  String image;
  String title;
  String subtitle;
  int likes;
  int id;

  static PostObject fromJson(Map<String, dynamic>? json) {
    return PostObject(
      image: json?['image'],
      subtitle: json?['subtitle'],
      title: json?['title'],
      likes: json?['likes'],
      id: json?['id'],
    );
  }
}
