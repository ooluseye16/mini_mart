import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_mart/models/cart_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/product.dart';

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void loadCartFromPrefs() async {
    final prefs = SharedPreferences.getInstance();
    final cartJsonList = prefs.then(
      (prefs) => prefs.getStringList('cart') ?? [],
    );
    final cartItems = await cartJsonList.then(
      (list) =>
          list.map((jsonStr) => CartItem.fromJsonString(jsonStr)).toList(),
    );
    state = cartItems;
  }

  Future<void> saveCartToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJsonList = state.map((item) => item.toJsonString()).toList();
    await prefs.setStringList('cart', cartJsonList);
  }

  void addToCart(Product product) {
    final index = state.indexWhere((item) => item.product.id == product.id);
    if (index == -1) {
      state = [...state, CartItem(product: product)];
    } else {
      final updated = [...state];
      updated[index].quantity += 1;
      state = updated;
    }
    saveCartToPrefs();
  }

  void removeFromCart(int productId) {
    state = state.where((item) => item.product.id != productId).toList();
    saveCartToPrefs();
  }

  void increaseQty(int productId) {
    final index = state.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      final updated = [...state];
      updated[index].quantity++;
      state = updated;
    }
    saveCartToPrefs();
  }

  void decreaseQty(int productId) {
    final index = state.indexWhere((item) => item.product.id == productId);
    if (index != -1 && state[index].quantity > 1) {
      final updated = [...state];
      updated[index].quantity--;
      state = updated;
    }
    saveCartToPrefs();
  }

  int get itemCount => state.fold(0, (sum, item) => sum + item.quantity);
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier()..loadCartFromPrefs();
});

final cartCountProvider = Provider<int>((ref) {
  final cart = ref.watch(cartProvider);

  return cart.fold(0, (sum, item) => sum + item.quantity);
});
