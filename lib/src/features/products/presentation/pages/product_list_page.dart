import 'package:ecommerce_app/src/features/products/presentation/pages/product_detail_page.dart';
import 'package:ecommerce_app/src/features/products/presentation/providers/products_provider.dart';
import 'package:ecommerce_app/src/features/products/presentation/widgets/product_card.dart';
import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductListPage extends ConsumerWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);
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
        itemCount: products.length,
        separatorBuilder: (_, _) => SizedBox(height: spacing.p32),
        itemBuilder: (context, index) {
          return ProductCard(
            product: products[index],
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDetailPage(productId: products[index].id),
              ),
            ),
          );
        },
      ),
    );
  }
}
