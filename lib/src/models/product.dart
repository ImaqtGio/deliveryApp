class ProductObject {
  ProductObject(
      {required this.image,
      required this.name,
      required this.price,
      required this.id,
      required this.description,
      });

  int id;
  String image;
  String name;
  double price;
  String description;

  static ProductObject fromJson(Map<String, dynamic>? json) {
    return ProductObject(
      id: json?['id'],
      image: json?['image'],
      name: json?['name'],
      price: json?['price'],
      description: json?['description'],
    );
  }
}
