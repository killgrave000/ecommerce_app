import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product_model.dart';

class ApiService {
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
