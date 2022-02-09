class CategorieObject {
  CategorieObject({
    required this.image,
    required this.name,
    required this.id,
  });

  String image;
  String name;
  int id;

  static CategorieObject fromJson(Map<String, dynamic>? json) {
    return CategorieObject(
      image: json?['image'],
      name: json?['name'],
      id: json?['id'],
    );
  }
}