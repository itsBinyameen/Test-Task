import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/core/api_services/products_api.dart';
import 'package:test_task/core/utils/show.dart';
import 'package:test_task/data/models/product_models.dart';
import 'package:test_task/modules/dashboard/products/product_details_screen.dart';

/// Controller for managing product listing, search, pagination, and product details.
class ProductsController extends GetxController {
  // Repository/API service
  final ProductsApi repository = ProductsApi();

  // SearchBar text field controller
  final TextEditingController searchController = TextEditingController();


  // Reactive state variables
  final RxList<ProductModel> allProducts =
      <ProductModel>[].obs; // Full fetched data
  final RxList<ProductModel> products =
      <ProductModel>[].obs; // Filtered products for UI
  final RxBool isLoading = false.obs;
  final RxBool hasMore = true.obs;
  final RxString searchQuery = ''.obs;

  // Pagination settings
  int page = 0;
  final int pageSize = 100;

  // Selected product for details view
  ProductModel selectedProduct = ProductModel();

  @override
  void onInit() {
    super.onInit();
    loadMoreProducts();
  }

  /// Triggers when search text is updated
  void onSearchChanged(String query) {
    searchQuery.value = query.trim();
    applySearchFilter();
  }

  /// Filters products based on the current search query
  void applySearchFilter() {
    if (searchQuery.isEmpty) {
      products.assignAll(allProducts);
    } else {
      final filtered =
          allProducts
              .where(
                (product) => product.title!.toLowerCase().contains(
                  searchQuery.value.toLowerCase(),
                ),
              )
              .toList();
      products.assignAll(filtered);
    }
  }

  /// Loads a new page of products from the API
  Future<void> loadMoreProducts() async {
    if (isLoading.value || !hasMore.value) return;

    isLoading.value = true;
    try {
      final newProducts = await repository.fetchProducts(
        limit: pageSize,
        skip: page * pageSize,
      );

      if (newProducts.length < pageSize) {
        hasMore.value = false;
      }

      allProducts.addAll(newProducts); // Save to master list
      applySearchFilter(); // Update UI list according to current search
      page++;
    } catch (e) {
      print('Error loading products: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Resets product list and reloads from the start
  void refreshProducts() {
    page = 0;
    hasMore.value = true;
    allProducts.clear();
    products.clear();
    loadMoreProducts();
  }

  /// Fetches details of a product by ID and navigates to the details screen
  Future<void> onProductDetails(int productId) async {
    Show.showLoader(); // Show loading indicator
    selectedProduct = await ProductsApi().fetchProductById(productId);
    Get.back(); // Close the loader
    Get.to(() => const ProductDetailsScreen());
  }
}
