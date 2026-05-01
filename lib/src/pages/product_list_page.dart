import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/domain/product.dart';
import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        foregroundColor: Colors.white,
        title: const Text('My Shop'),
        centerTitle: false,
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(
          vertical: spacing.p48,
          horizontal: spacing.p24,
        ),
        itemCount: kTestProducts.length,
        separatorBuilder: (_, _) => SizedBox(height: spacing.p32),
        itemBuilder: (context, index) {
          return ProductCard(product: kTestProducts[index]);
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Card(
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
            SizedBox(height: spacing.p24),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: spacing.p12),
            Text(
              'Quantity: ${product.stockQuantity}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

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
