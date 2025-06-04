import 'dart:convert';

class Product {
  final int id;
  final String name;
  final String image;
  final String description;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    name: json['name'],
    image: json['image'],
    description: json['description'],
    price: (json['price'] as num).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'image': image,
    'description': description,
    'price': price,
  };

  //toJsonString
  String toJsonString() {
    return json.encode(toJson());
  }

  //fromJsonString
  static Product fromJsonString(String jsonString) {
    return Product.fromJson(json.decode(jsonString));
  }
}

