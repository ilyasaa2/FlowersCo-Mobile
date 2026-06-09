import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService {
  static Future<List<dynamic>> getProducts() async {
    final response = await http.get(
      Uri.parse(
        'http://127.0.0.1/api_flowers/get_products.php',
      ),
    );

    return jsonDecode(response.body);
  }
}