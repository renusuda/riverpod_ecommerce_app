import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      product.imageUrl,
      fit: BoxFit.contain,
      semanticLabel: product.name,
    );
  }
}
