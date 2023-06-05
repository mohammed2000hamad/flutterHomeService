import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  late SharedPreferences _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveToken(String token) {
    _sharedPreferences.setString('token', 'Bearer $token');
  }

  void saveUserId(int userId) {
    _sharedPreferences.setInt('userId', userId);
  }

  int getUserId() {
    return _sharedPreferences.getInt('userId') ?? -1;
  }

  void deleteUserId() {
    _sharedPreferences.remove('userId');
  }

  void deleteUserPhone() {
    _sharedPreferences.remove('userPhone');
  }

  String? getToken() {
    return _sharedPreferences.getString('token');
  }

  String? getUserPhone() {
    return _sharedPreferences.getString('userPhone');
  }

  void saveUserPhone(String userPhone) {
    _sharedPreferences.setString('userPhone', userPhone);
  }

  void deleteToken() {
    _sharedPreferences.remove('token');
  }
}
