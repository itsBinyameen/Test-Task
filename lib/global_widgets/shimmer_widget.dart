import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProductCard extends StatelessWidget {
  const ShimmerProductCard({super.key, this.height, this.margin});
  final double? height;
  final double? margin;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin:  EdgeInsets.only(bottom: margin??16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        height: height ??200,
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 16, color: Colors.white, margin: const EdgeInsets.symmetric(vertical: 6)),
                  Container(height: 12, width: 150, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
