import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/core/theme/text_theme.dart';
import 'package:test_task/global_widgets/product_card_widget.dart';
import 'package:test_task/global_widgets/text_field_widget.dart';
import 'package:test_task/modules/dashboard/categories/categories_controller.dart';
import 'package:test_task/modules/dashboard/products/product_details_screen.dart';
import 'package:test_task/modules/dashboard/products/products_controller.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String categoryTitle;
  final String categorySlug;

  CategoryProductsScreen({
    super.key,
    required this.categoryTitle,
    required this.categorySlug,
  });

  final controller = Get.find<CategoriesController>();
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle, style: TextStyles.h1)),
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          final products = controller.filteredCategoryProducts;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldWidget(
                  textEditingController: searchController,
                  onchange: (value) {
                    controller.searchCategoryProducts(value);
                  },
                ),
                const SizedBox(height: 10),
                Text(
                  "${products.length} results found",
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.separated(
                    itemCount: products.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      final productController = Get.put(ProductsController());
                      return ProductCardWidget(
                        product: product,
                        onTap: () {
                          productController.selectedProduct = product;

                          Get.to(() => ProductDetailsScreen());
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
