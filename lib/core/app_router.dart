import 'package:flutter/material.dart';
import 'package:mini_mart/models/product.dart';
import 'package:mini_mart/views/screens/navigation.dart';
import 'package:mini_mart/views/screens/products/product_details.dart';
import 'package:mini_mart/views/screens/products/products_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Navigation.routeName:
        return MaterialPageRoute(
          builder: (context) => const Navigation(),
          settings: RouteSettings(name: settings.name),
        );
      case ProductsScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const ProductsScreen(),
          settings: RouteSettings(name: settings.name),
        );

      case '/product-details':
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder:
              (context) => ProductDetailsScreen(
                product: args['product'] as Product,
                heroTag: args['heroTag'] as String,
              ),
          settings: RouteSettings(name: settings.name),
        );
      default:
        return MaterialPageRoute(
          builder:
              (context) => const Scaffold(body: Center(child: Text('404'))),
        );
    }
  }
}
