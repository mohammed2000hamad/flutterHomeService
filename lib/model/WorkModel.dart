
class WorkModel {
  final int id;
  final String name;
  final String icon;
  final String description;
  final int active;

  WorkModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
    required this.active,
  });

  factory WorkModel.fromJson(Map<String, dynamic> json) {
    return WorkModel(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      description: json['description'],
      active: json['active'],
    );
  }
}