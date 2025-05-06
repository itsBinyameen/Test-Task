import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_task/data/models/product_models.dart';

/// Controller for managing favorite products and searching within them.
class FavouriteController extends GetxController {
  // Controller for the search input field
  final searchController = TextEditingController();

  // List of favorite products (observable for reactive UI updates)
  var favoriteProducts = <ProductModel>[].obs;

  // Search query for filtering favorite products
  var searchQuery = ''.obs;

  /// Toggles a product's favorite status.
  /// Adds it if not already in favorites, removes it if present.
  void toggleFavorite(ProductModel product) {
    if (favoriteProducts.contains(product)) {
      favoriteProducts.remove(product);
    } else {
      favoriteProducts.add(product);
    }
  }

  /// Checks if a product is marked as favorite.
  bool isFavorite(ProductModel product) {
    return favoriteProducts.contains(product);
  }

  /// Returns the list of favorite products filtered by the search query.
  List<ProductModel> get filteredFavorites {
    if (searchQuery.isEmpty) return favoriteProducts;
    return favoriteProducts
        .where(
          (product) => product.title!.toLowerCase().contains(
            searchQuery.value.toLowerCase(),
          ),
        )
        .toList();
  }

  /// Updates the search query used to filter favorites.
  void updateSearch(String query) {
    searchQuery.value = query;
  }
}
