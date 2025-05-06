import 'package:flutter/material.dart';
import 'package:test_task/core/theme/text_theme.dart';
import 'package:test_task/data/models/product_models.dart';
import 'package:test_task/global_widgets/my_network_image.dart';
import 'package:test_task/global_widgets/rating_bar_widget.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductModel product;
  final Function()? onTap;

  const ProductCardWidget({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                child: MyNetworkImage(
                  image: product.imageUrl ?? '',
                  height: 200,
                  width: double.infinity,
                  boxFit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.title ?? '', style: TextStyles.h3),
                  Text(
                    "\$${product.price?.toStringAsFixed(0)}",
                    style: TextStyles.h2,
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Text(
                    product.rating!.toStringAsFixed(1),
                    style: TextStyles.h4,
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
              Text("By ${product.brand}", style: TextStyles.bodyTextGrey),
              const SizedBox(height: 4),
              Text("In ${product.category}", style: TextStyles.bodyTextSmall),
            ],
          ),
        ),
      ),
    );
  }
}
