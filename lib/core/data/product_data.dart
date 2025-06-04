import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mini_mart/core/data/exception.dart';
import 'package:mini_mart/models/product.dart';

class ProductRepository {
  Future<List<Product>> loadProducts() async {
    try {
      final data = await rootBundle.loadString('assets/data/products.json');
      final jsonResult = json.decode(data) as List<dynamic>;
      return jsonResult.map((e) => Product.fromJson(e)).toList();
    } catch (e) {
      throw ApiException.fromError(e);
    }
  }

  Future<Product> loadProductById(int id) async {
    final products = await loadProducts();
    return products.firstWhere(
      (product) => product.id == id,
      orElse: () => throw ApiException('Product not found'),
    );
  }
}
