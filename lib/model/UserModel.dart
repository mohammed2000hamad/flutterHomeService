
class User {
  final int id;
  final String name;
  final String email;
  final String photo;
  final String phone;
  final String active;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.photo,
    required this.phone,
    required this.active,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      photo: json['photo'],
      phone: json['phone'],
      active: json['active'],
      token: json['token'],
    );
  }
}
