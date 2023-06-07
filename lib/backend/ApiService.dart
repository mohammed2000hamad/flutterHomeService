import 'dart:convert';

import 'package:home_service_flutter/model/OrderModel.dart';
import 'package:home_service_flutter/model/WorkModel.dart';
import 'package:http/http.dart' as http;

import '../model/UserModel.dart';

class ApiService {
  static const String baseUrl = 'https://studentucas.awamr.com/api';

  Future<User> loginUser(String email, String password) async {
    final url = Uri.parse('$baseUrl/auth/login/user');
    final response = await http.post(url, body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData['success'] == true) {
        return User.fromJson(jsonData['data']);
      } else {
        throw Exception(jsonData['message']);
      }
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<User> registerUser(
      String name, String email, String password, String phone) async {
    final url = Uri.parse('$baseUrl/auth/register/user');
    final response = await http.post(url, body: {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone
    });

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData['success'] == true) {
        final data = jsonData['data'];

        final id = data['id'] as int? ?? 0;
        final name = data['name'] as String? ?? '';
        final email = data['email'] as String? ?? '';
        final photo = data['photo'] as String? ?? '';
        final phone = data['phone'] as String? ?? '';
        final active = data['active'] as String? ?? '';
        final token = data['token'] as String? ?? '';

        return User(
            id: id,
            name: name,
            email: email,
            photo: photo,
            phone: phone,
            active: active,
            token: token);
      } else {
        throw Exception(jsonData['message']);
      }
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<List<WorkModel>> getAllWorks() async {
    final url = Uri.parse('$baseUrl/all/works');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final dataList = jsonData['data'] as List<dynamic>;

      final works = dataList.map((item) => WorkModel.fromJson(item)).toList();
      return works;
    } else {
      throw Exception('Failed to get works');
    }
  }

  Future<OrderModel> createOrder(
      int userId,
      int workId,
      String details,
      String detailsAddress,
      String lat,
      String long,
      String phone) async {
    final url = Uri.parse('$baseUrl/auth/register/user');
    Uri.parse('$base64Url/create/order');
    final response = await http.post(url, body: {
      'user_id': userId,
      'work_id': workId,
      'details': details,
      'details_address': detailsAddress,
      'lat': lat,
      'long': long,
      'phone': phone,
    });

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData['success'] == true) {
        final data = jsonData['data'];

        final phone = data['phone'] as String? ?? '';
        final int  userId = (data['user_id'] as String? ?? '') as int;
        final int  workId = (data['work_id'] as String? ?? '') as int;
        final details = data['details'] as String? ?? '';
        final details_address = data['details_address'] as String? ?? '';
        final lat = data['lat'] as String? ?? '';
        final long = data['long'] as String? ?? '';

        return OrderModel(
          userId: userId,
          workId: workId,
          details: details,
          detailsAddress: details_address,
          lat: lat,
          long: long,
          phone: phone,
        );
      } else {
        throw Exception(jsonData['message']);
      }
    } else {
      throw Exception('Failed to login');
    }
  }
}
