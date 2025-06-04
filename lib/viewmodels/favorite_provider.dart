import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_mart/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider extends StateNotifier<List<Product>> {
  FavoriteProvider() : super([]);

  Future<void> loadFavoritesFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteJsonList = prefs.getStringList('favorites') ?? [];
    final products =
        favoriteJsonList
            .map((jsonStr) => Product.fromJsonString(jsonStr))
            .toList();
    state = products;
  }

  Future<void> saveFavoritesToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteJsonList =
        state.map((product) => product.toJsonString()).toList();
    await prefs.setStringList('favorites', favoriteJsonList);
  }

  void addToFavorites(Product product) {
    if (!state.any((item) => item.id == product.id)) {
      state = [...state, product];
    }
    saveFavoritesToPrefs();
  }

  void removeFromFavorites(int productId) {
    state = state.where((item) => item.id != productId).toList();
    saveFavoritesToPrefs();
  }

  bool isFavorite(int productId) {
    return state.any((item) => item.id == productId);
  }
}

final favoritesProvider =
    StateNotifierProvider<FavoriteProvider, List<Product>>((ref) {
      return FavoriteProvider()..loadFavoritesFromPrefs();
    });

final isFavoriteProvider = Provider.family<bool, int>((ref, productId) {
  final favorites = ref.watch(favoritesProvider);
  return favorites.any((item) => item.id == productId);
});
