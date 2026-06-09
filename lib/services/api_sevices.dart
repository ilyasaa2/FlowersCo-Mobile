import 'dart:convert';
import 'package:http/http.dart' as http;


class ApiService {

  static Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {

    final response = await http.post(
      Uri.parse(
        'http://10.0.2.2/api_flowers/login.php',
      ),
      body: {
        'email': email,
        'password': password,
      },
    );

    return jsonDecode(response.body);
  }
}