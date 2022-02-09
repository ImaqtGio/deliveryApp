class ProfileObject {
  ProfileObject({
    required this.image,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.id,
  });

  int id;
  String firstName;
  String lastName;
  String email;
  String image;

  static ProfileObject fromJson(Map<String, dynamic>? json) {
    return ProfileObject(
      id: json?['id'],
      firstName: json?['first_name'],
      lastName: json?['last_name'],
      email: json?['email'],
      image: json?['image'],
    );
  }
}
