import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        foregroundColor: Colors.white,
        title: const Text('My Shop'),
        centerTitle: false,
      ),
      body: Center(
        child: Text(
          product.name,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
