import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProductRatingBar extends StatelessWidget {
  const ProductRatingBar({
    super.key,
    required this.averageRating,
    required this.reviewCount,
  });

  final double averageRating;
  final int reviewCount;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Row(
      children: [
        const Icon(Icons.star, color: Color(0xFFFFC107)),
        SizedBox(width: spacing.p8),
        Text(
          averageRating.toStringAsFixed(1),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(width: spacing.p8),
        Text(
          '$reviewCount ratings',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
