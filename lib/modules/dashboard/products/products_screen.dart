import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/global_widgets/product_card_widget.dart';
import 'package:test_task/global_widgets/shimmer_widget.dart';
import 'package:test_task/global_widgets/text_field_widget.dart';
import 'package:test_task/modules/dashboard/products/product_details_screen.dart';
import 'package:test_task/modules/dashboard/products/products_controller.dart';

class ProductsScreen extends GetView<ProductsController> {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldWidget(
                      textEditingController: controller.searchController,
                      onchange: controller.onSearchChanged,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${controller.products.length} results found",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Obx(() {
                  return NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification.metrics.pixels ==
                              scrollNotification.metrics.maxScrollExtent &&
                          !controller.isLoading.value &&
                          controller.hasMore.value &&
                          controller.searchQuery.value.isEmpty) {
                        // Only load more if not searching
                        controller.loadMoreProducts();
                      }
                      return false;
                    },
                    child: ListView.separated(
                      itemCount:
                          controller.products.length +
                          ((controller.hasMore.value &&
                                  controller.searchQuery.value.isEmpty)
                              ? 1
                              : 0),
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        if (index < controller.products.length) {
                          final product = controller.products[index];
                          return ProductCardWidget(
                            product: product,
                            onTap: () {
                              controller.selectedProduct = product;
                              Get.to(() => ProductDetailsScreen());
                            },
                          );
                        } else {
                          return  Column(
                            children: List.generate(3, (_) => const ShimmerProductCard()),
                          );
                        }
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
