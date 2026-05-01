import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.productId});

  final String productId;

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
          productId,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
