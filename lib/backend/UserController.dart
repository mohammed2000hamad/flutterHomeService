import 'package:flutter/material.dart';

import '../model/UserModel.dart';
import 'ApiService.dart';

class UserController {
  final ApiService apiService = ApiService();

  Future<User> loginUser(String email, String password) async {
    try {
      final user = await apiService.loginUser(email, password);
      // Add any additional logic here
      return user;
    } catch (e) {
      debugPrint('Error: $e');
      rethrow;
    }
  }

  Future<User> registerUser(String name, String email, String password,String phone) async {
    try {
      final user = await apiService.registerUser(name, email, password,phone);
      // Add any additional logic here
      return user;
    } catch (e) {
      debugPrint('Error: $e');
      rethrow;
    }
  }
}
