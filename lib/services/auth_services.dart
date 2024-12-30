import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl = "http://127.0.0.1:8000/";

  Future<String?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/api/token/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": username, "password": password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['access']; // Return the access token
    } else {
      Logger().i('Login failed: ${response.body}');
      return null;
    }
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<bool> signup(String username, String password, String email) async {
    final response = await http.post(
      Uri.parse("$baseUrl/api/signup/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": username,
        "password": password,
        "email": email,
      }),
    );

    if (response.statusCode == 201) {
      return true; // Signup successful
    } else {
      Logger().i("Signup failed: ${response.body}");
      return false; // Signup failed
    }
  }
}
