import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_task/core/utils/api_constants.dart';
import 'package:test_task/data/models/category_model.dart';

class CategoryApi {

  static Future<List<CategoryModel>> fetchCategories() async {
    final response = await http.get(Uri.parse(EndPoint.categories));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((e) => CategoryModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch categories');
    }
  }
}
