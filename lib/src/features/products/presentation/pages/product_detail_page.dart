import 'package:ecommerce_app/src/common_widgets/app_card.dart';
import 'package:ecommerce_app/src/common_widgets/async_value_widget.dart';
import 'package:ecommerce_app/src/extensions/int_extensions.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:ecommerce_app/src/features/products/presentation/providers/products_provider.dart';
import 'package:ecommerce_app/src/features/products/presentation/widgets/product_image.dart';
import 'package:ecommerce_app/src/features/products/presentation/widgets/product_rating_bar.dart';
import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductDetailPage extends ConsumerWidget {
  const ProductDetailPage({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsyncValue = ref.watch(productProvider(productId));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        foregroundColor: Colors.white,
        title: const Text('ショップ'),
        centerTitle: false,
      ),
      body: AsyncValueWidget(
        asyncValue: productAsyncValue,
        data: (product) => _ProductDetailView(product: product),
      ),
    );
  }
}

class _ProductDetailView extends StatelessWidget {
  const _ProductDetailView({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: EdgeInsets.all(spacing.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCard(child: ProductImage(product: product)),
          SizedBox(height: spacing.p16),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: textTheme.titleLarge),
                SizedBox(height: spacing.p4),
                Text(product.description, style: textTheme.bodyMedium),
                SizedBox(height: spacing.p8),
                ProductRatingBar(
                  averageRating: product.averageRating,
                  reviewCount: product.reviewCount,
                ),
                const Divider(height: 32),
                Text(
                  '¥${product.price.commaSeparated}',
                  style: textTheme.headlineMedium,
                ),
                const Divider(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      padding: EdgeInsets.symmetric(vertical: spacing.p16),
                    ),
                    child: Text(
                      'カートに追加',
                      style: textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
