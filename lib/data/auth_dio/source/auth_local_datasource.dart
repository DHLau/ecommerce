import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  static const _tokenKey = "token";

  String? _token;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString(_tokenKey);
  }

  String? getToken() => _token;

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    _token = token;
    await prefs.setString(_tokenKey, token);
  }

  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = null;
    await prefs.remove(_tokenKey);
  }
}
