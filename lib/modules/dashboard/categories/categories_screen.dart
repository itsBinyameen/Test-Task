import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/core/utils/asset_constants.dart';
import 'package:test_task/global_widgets/shimmer_widget.dart';
import 'package:test_task/global_widgets/text_field_widget.dart';
import 'package:test_task/modules/dashboard/categories/categories_controller.dart';
import 'package:test_task/modules/dashboard/categories/category_products_screen.dart';
import 'package:test_task/modules/dashboard/local_widgets/category_card_widget.dart';

class CategoriesScreen extends GetView<CategoriesController> {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = controller.visibleCategories;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Obx(() {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldWidget(
                  textEditingController: controller.searchController,
                  onchange: controller.searchCategories,
                ),
                const SizedBox(height: 10),
                Text(
                  "${categories.length} results found",
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 10),
                controller.isLoading.value
                    ? Column(
                  children: List.generate(
                    3,
                        (_) => const ShimmerProductCard(),
                  ),
                )
                    : GridView.builder(
                  physics: const NeverScrollableScrollPhysics(), // disable inner scroll
                  shrinkWrap: true, // let GridView size itself based on items
                  itemCount: categories.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 27,
                    mainAxisSpacing: 22,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return GestureDetector(
                      onTap: () async {
                        await controller.fetchCategoryProducts(category.slug);
                        Get.to(() => CategoryProductsScreen(
                          categoryTitle: category.name,
                          categorySlug: category.slug,
                        ));
                      },
                      child: CategoryCardWidget(
                        title: category.name,
                        imagePath: AppAssets.phone,
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );

  }
}
