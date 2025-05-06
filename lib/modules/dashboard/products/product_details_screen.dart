import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:test_task/core/theme/text_theme.dart';
import 'package:test_task/global_widgets/my_network_image.dart';
import 'package:test_task/global_widgets/rating_bar_widget.dart';
import 'package:test_task/modules/dashboard/favourite/favourite_controller.dart';
import 'package:test_task/modules/dashboard/products/products_controller.dart';

class ProductDetailsScreen extends GetView<ProductsController> {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = controller.selectedProduct;
    final favController = Get.put(FavouriteController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.adaptive.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('Product Details', style: TextStyles.h1),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Product Main Image
              MyNetworkImage(
                image: product.imageUrl ?? '',
                height: Get.height * 0.25,
                width: double.infinity,
                boxFit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Product Details Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Product Details:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Obx(
                          () => IconButton(
                            icon: Icon(
                              favController.isFavorite(product)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            ),
                            color:
                                favController.isFavorite(product)
                                    ? Colors.red
                                    : Colors.grey,
                            onPressed: () {
                              favController.toggleFavorite(product);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    buildDetailTextWidget("Name", product.title ?? ''),
                    buildDetailTextWidget("Price", "\$${product.price ?? ''}"),
                    buildDetailTextWidget("Category", product.category ?? ''),
                    buildDetailTextWidget("Brand", product.brand ?? ''),
                    Row(
                      children: [
                        Text("Rating :  ", style: TextStyles.h4),
                        Text(
                          product.rating?.toStringAsFixed(1) ?? '0',
                          style: TextStyles.bodyTextSmall,
                        ),
                        const SizedBox(width: 4),
                        ratingBar(
                          size: 12,
                          initialRating: product.rating ?? 0.0,
                          onChange: (rating) {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    buildDetailTextWidget("Stock", '${product.stock}'),
                    const SizedBox(height: 16),

                    /// Description
                    Text("Description :", style: TextStyles.h3),
                    const SizedBox(height: 4),
                    Text(
                      product.description ??
                          "Lorem ipsum har varit standard ända.",
                      style: TextStyles.bodyTextSmall,
                    ),
                    const SizedBox(height: 16),

                    /// Product Gallery
                    Text("Product Gallery :", style: TextStyles.h3),
                    const SizedBox(height: 10),
                    MasonryGridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: product.gallery?.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white,
                          child: MyNetworkImage(
                            image: product.gallery?[index] ?? '',
                            boxFit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildDetailTextWidget(String title, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$title :  ", style: TextStyles.h4),
        Expanded(child: Text(value, style: TextStyles.bodyTextSmall)),
      ],
    ),
  );
}
