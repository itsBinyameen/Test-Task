import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/core/theme/text_theme.dart';
import 'package:test_task/data/models/product_models.dart';
import 'package:test_task/global_widgets/my_network_image.dart';
import 'package:test_task/global_widgets/rating_bar_widget.dart';
import 'package:test_task/modules/dashboard/favourite/favourite_controller.dart';

class FavouriteCardWidget extends StatelessWidget {
  final ProductModel product;

  const FavouriteCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final favController = Get.find<FavouriteController>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Card(
        color: Colors.white,

        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              ClipOval(
                child: MyNetworkImage(
                  image: product.imageUrl ?? '',
                  width: 60,
                  height: 60,
                  boxFit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title ?? '', style: TextStyles.h3),
                    const SizedBox(height: 4),
                    Text(
                      "\$${product.price}",
                      style: TextStyles.h4!.copyWith(fontSize: 13),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          "${product.rating?.toStringAsFixed(1)}",
                          style: TextStyles.bodyTextSmall,
                        ),
                        const SizedBox(width: 4),
                        ratingBar(
                          initialRating: product.rating ?? 0.0,
                          size: 12,
                          onChange: () {},
                        ),
                      ],
                    ),
                  ],
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
        ),
      ),
    );
  }
}
