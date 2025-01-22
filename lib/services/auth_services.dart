import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl = "http://192.168.0.197:8000";

  Future<String?> fetchToken(String email, String password) async {
    Logger().i(email);
    Logger().i(password);
    final url = Uri.parse("$baseUrl/api/contractor/token/");
    Logger().i(url);
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        <String, String>{
          'email': email,
          'password': password,
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['token'];
    } else {
      Logger().i(response.statusCode);
      return null;
    }
  }

  Future<String?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/api/contractor/token/"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(
        {
          "email": email,
          "password": password,
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['token'];
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
