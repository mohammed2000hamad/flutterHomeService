class OrderModel {
  final int? id;
  final int userId;
  final int? deliveryId;
  final int workId;
  final String details;
  final String detailsAddress;
  final String lat;
  final String long;
  final String phone;
  final int? status;
  final DateTime ?createdAt;
  final DateTime ?updatedAt;

  OrderModel({
     this.id,
    required this.userId,
     this.deliveryId,
    required this.workId,
    required this.details,
    required this.detailsAddress,
    required this.lat,
    required this.long,
    required this.phone,
     this.status,
     this.createdAt,
     this.updatedAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      userId: json['user_id'],
      deliveryId: json['delivery_id'],
      workId: json['work_id'],
      details: json['details'],
      detailsAddress: json['details_address'],
      lat: json['lat'],
      long: json['long'],
      phone: json['phone'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
