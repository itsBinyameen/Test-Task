// import 'package:flutter/material.dart';
// import 'package:test_task/core/theme/text_theme.dart';
// import 'package:test_task/core/utils/asset_constants.dart';
// import 'package:test_task/global_widgets/text_field_widget.dart';
//
// class FavouriteScreen extends StatelessWidget {
//   const FavouriteScreen({super.key});
//
//   final List<Map<String, dynamic>> products = const [
//     {
//       'name': 'Iphone 9',
//       'price': 60,
//       'rating': 4.9,
//       'image': AppAssets.iphone,
//     },
//     {
//       'name': 'Iphone 9',
//       'price': 60,
//       'rating': 4.9,
//       'image': AppAssets.iphone,
//     },
//     {
//       'name': 'Iphone 9',
//       'price': 60,
//       'rating': 4.9,
//       'image': AppAssets.iphone,
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextFieldWidget(
//               onchange: (){},
//               textEditingController: TextEditingController(),
//             ),
//             const SizedBox(height: 10),
//             Text("234 results found", style: TextStyle(color: Colors.grey)),
//             const SizedBox(height: 10),
//             Expanded(
//               child: ListView.separated(
//                 padding: const EdgeInsets.all(16),
//                 itemCount: products.length,
//                 separatorBuilder: (_, __) => const SizedBox(height: 12),
//                 itemBuilder: (context, index) {
//                   final product = products[index];
//                   return FavouriteCardWidget(
//                     name: product['name'],
//                     price: product['price'].toDouble(),
//                     rating: product['rating'],
//                     imagePath: product['image'],
//                   );
//                 },
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/core/theme/text_theme.dart';
import 'package:test_task/data/models/product_models.dart';
import 'package:test_task/global_widgets/my_network_image.dart';
import 'package:test_task/global_widgets/rating_bar_widget.dart';
import 'package:test_task/global_widgets/text_field_widget.dart';
import 'package:test_task/modules/dashboard/favourite/favourite_controller.dart';
import 'package:test_task/modules/dashboard/local_widgets/favourite_card_widget.dart';
import 'package:test_task/modules/dashboard/products/product_details_screen.dart';
import 'package:test_task/modules/dashboard/products/products_controller.dart';

class FavouriteScreen extends GetView<FavouriteController> {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final filteredFavorites = controller.filteredFavorites;

      return Padding(
        padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldWidget(
              textEditingController: controller.searchController,
              onchange: (val) {
                controller.updateSearch(val);
              },
            ),
            const SizedBox(height: 10),
            Text(
              "${filteredFavorites.length} results found",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filteredFavorites.length,
                itemBuilder: (context, index) {
                  final product = filteredFavorites[index];
                  return GestureDetector(
                    onTap: () {
                      Get.find<ProductsController>().selectedProduct = product;
                      Get.to(() => ProductDetailsScreen());
                    },
                    child: FavouriteCardWidget(product: product),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
