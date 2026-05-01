import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/domain/product.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        foregroundColor: Colors.white,
        title: const Text('My Shop'),
        centerTitle: false,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 46, horizontal: 24),
        itemCount: kTestProducts.length,
        separatorBuilder: (_, _) => const SizedBox(height: 28),
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
    return Card(
      color: const Color(0xFFFBF6FE),
      elevation: 1,
      shadowColor: const Color(0x26000000),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: const BorderSide(color: Color(0xFFF0EAF3)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(product: product),
            const SizedBox(height: 24),
            const Divider(height: 1, thickness: 1, color: Color(0xFFD7D0DA)),
            const SizedBox(height: 24),
            Text(
              product.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
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
