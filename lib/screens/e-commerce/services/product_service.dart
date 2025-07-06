import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductService {
  static const String _baseUrl = 'https://dummyjson.com/products';

  Future<Map<String, List<Product>>> fetchAndGroupProducts() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> productListJson = data['products'];

        final List<Product> products = productListJson
            .map((jsonItem) => Product.fromJson(jsonItem))
            .toList();

        return _groupProductsByCategory(products);
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  Map<String, List<Product>> _groupProductsByCategory(List<Product> products) {
    final Map<String, List<Product>> groupedProducts = {};
    for (var product in products) {
      if (groupedProducts.containsKey(product.category)) {
        groupedProducts[product.category]!.add(product);
      } else {
        groupedProducts[product.category] = [product];
      }
    }
    return groupedProducts;
  }
}
