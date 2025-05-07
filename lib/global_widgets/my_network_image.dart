import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_task/global_widgets/shimmer_widget.dart';

class MyNetworkImage extends StatelessWidget {
  const MyNetworkImage({
    super.key,
    required this.image,
    this.height,
    this.width,
    required this.boxFit,
  });

  final String image;
  final double? height;
  final double? width;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: boxFit,
      height: height,
      width: width,
      imageUrl: image,
      placeholder:
          (context, url) => const Center(child: ShimmerProductCard(height:170,margin: 0,)),
      errorWidget:
          (context, url, error) => Image.asset(
            'assets/icons/splash.png',
            fit: boxFit,
            height: height,
            width: width,
          ),
    );
  }
}
