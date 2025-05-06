import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

RatingBar ratingBar({
  double? size,
  required double initialRating,
  bool? isNotEditable,
  required Function onChange,
}) {
  return RatingBar.builder(
    initialRating: initialRating,
    ignoreGestures: isNotEditable ?? true,
    minRating: 1,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemCount: 5,
    itemSize: size ?? 18,
    unratedColor: Colors.grey.shade300,
    itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
    onRatingUpdate: (rating) => onChange(rating),
  );
}
