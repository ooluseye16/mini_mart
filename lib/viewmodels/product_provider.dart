import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_mart/core/data/product_data.dart';

import '../models/product.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository();
});

final productListProvider = FutureProvider<List<Product>>((ref) async {
  final allProducts = await ref.read(productRepositoryProvider).loadProducts();

  final query = ref.watch(productSearchQueryProvider).toLowerCase();
  return allProducts.where((product) {
    final name = product.name.toLowerCase();
    return name.contains(query);
  }).toList();
});

final productSearchQueryProvider = StateProvider<String>((ref) => '');
