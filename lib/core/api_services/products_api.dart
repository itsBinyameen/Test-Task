// product_repository.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_task/core/utils/api_constants.dart';
import 'package:test_task/data/models/product_models.dart';

class ProductsApi {
  Future<List<ProductModel>> fetchProducts({
    int limit = 10,
    int skip = 0,
  }) async {
    final response = await http.get(
      Uri.parse('${EndPoint.products}?limit=$limit&skip=$skip'),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      List products = jsonData['products'];
      return products.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  Future<ProductModel> fetchProductById(int id) async {
    final response = await http.get(Uri.parse('${EndPoint.products}/$id'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return ProductModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch product by ID');
    }
  }

  Future<List<ProductModel>> fetchProductsByCategory(String slug) async {
    final response = await http.get(
      Uri.parse('${EndPoint.products}/category/$slug'),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      List products = jsonData['products'];
      return products.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch products for category $slug');
    }
  }
}
