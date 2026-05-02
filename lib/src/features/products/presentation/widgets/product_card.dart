import 'package:ecommerce_app/src/extensions/int_extensions.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:ecommerce_app/src/features/products/presentation/widgets/product_image.dart';
import 'package:ecommerce_app/src/features/products/presentation/widgets/product_rating_bar.dart';
import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, required this.onTap});

  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Card(
        color: const Color(0xFFFBF6FE),
        elevation: 1,
        shadowColor: const Color(0x26000000),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
          side: const BorderSide(color: Color(0xFFF0EAF3)),
        ),
        child: Padding(
          padding: EdgeInsets.all(spacing.p24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImage(product: product),
              SizedBox(height: spacing.p24),
              const Divider(height: 1, thickness: 1, color: Color(0xFFD7D0DA)),
              SizedBox(height: spacing.p24),
              Text(
                product.name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: spacing.p12),
              ProductRatingBar(
                averageRating: product.averageRating,
                reviewCount: product.reviewCount,
              ),
              SizedBox(height: spacing.p24),
              Text(
                '¥${product.price.commaSeparated}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: spacing.p12),
              Text(
                '在庫数: ${product.stockQuantity}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
