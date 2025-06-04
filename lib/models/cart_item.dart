import 'dart:convert';

import 'package:mini_mart/models/product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
  String toJsonString() {
    return '{"product": ${product.toJsonString()}, "quantity": $quantity}';
  }

  static CartItem fromJsonString(String jsonString) {
    final jsonMap = json.decode(jsonString);
    return CartItem(
      product: Product.fromJson(jsonMap['product']),
      quantity: jsonMap['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'product': product.toJson(), 'quantity': quantity};
  }

  static CartItem fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: Product.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }
}
