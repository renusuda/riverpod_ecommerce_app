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
        if (averageRating > 0) ...[
          const Icon(Icons.star, color: Color(0xFFFFC107)),
          SizedBox(width: spacing.p8),
          Text(
            averageRating.toStringAsFixed(1),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(width: spacing.p8),
        ],
        if (reviewCount > 0)
          Text(
            '$reviewCount 件のレビュー',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
      ],
    );
  }
}
