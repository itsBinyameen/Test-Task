import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_task/core/api_services/category_api.dart';
import 'package:test_task/core/api_services/products_api.dart';
import 'package:test_task/data/models/category_model.dart';
import 'package:test_task/data/models/product_models.dart';

/// Controller for handling category and category-wise product data.
class CategoriesController extends GetxController {
  // UI text controller for search input
  final searchController = TextEditingController();

  // Category Data
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> visibleCategories = <CategoryModel>[].obs;

  // Pagination variables
  final int pageSize = 100;
  int currentPage = 0;

  // Product Data for selected category
  RxList<ProductModel> categoryProducts = <ProductModel>[].obs;
  RxList<ProductModel> filteredCategoryProducts = <ProductModel>[].obs;

  // State & search query observables
  RxBool isLoading = false.obs;
  RxString searchQuery = ''.obs;
  RxString productSearchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  /// Fetches all categories from API and initializes visible categories with pagination
  Future<void> fetchCategories() async {
    isLoading.value = true;
    try {
      final categories = await CategoryApi.fetchCategories();
      allCategories.assignAll(categories);
      applyPagination(); // Load first page
    } catch (e) {
      print('Category fetch failed: $e');
    }
    isLoading.value = false;
  }

  /// Applies pagination to show limited categories per page
  void applyPagination() {
    int start = currentPage * pageSize;
    int end = start + pageSize;

    if (start >= allCategories.length) return;

    final page = allCategories.sublist(
      start,
      end > allCategories.length ? allCategories.length : end,
    );
    visibleCategories.addAll(page);
    currentPage++;
  }

  /// Filters visible categories based on search query
  void searchCategories(String query) {
    searchQuery.value = query;

    if (query.isEmpty) {
      // Show categories up to the current pagination limit
      visibleCategories.assignAll(allCategories.take(currentPage * pageSize));
    } else {
      // Filter categories by name
      visibleCategories.assignAll(
        allCategories
            .where(
              (cat) => cat.name.toLowerCase().contains(query.toLowerCase()),
            )
            .toList(),
      );
    }
  }

  /// Fetches products for a specific category by its slug
  Future<void> fetchCategoryProducts(String slug) async {
    isLoading.value = true;
    try {
      final products = await ProductsApi().fetchProductsByCategory(slug);
      categoryProducts.assignAll(products);
      filteredCategoryProducts.assignAll(products); // Set initial display list
    } catch (e) {
      print("Product fetch error: $e");
    }
    isLoading.value = false;
  }

  /// Filters the category products based on a search query
  void searchCategoryProducts(String query) {
    productSearchQuery.value = query;

    if (query.isEmpty) {
      filteredCategoryProducts.assignAll(categoryProducts);
    } else {
      filteredCategoryProducts.assignAll(
        categoryProducts.where(
          (product) =>
              product.title!.toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }
  }
}
