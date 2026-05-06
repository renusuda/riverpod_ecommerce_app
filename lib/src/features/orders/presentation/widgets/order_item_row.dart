import 'package:ecommerce_app/src/common_widgets/async_value_widget.dart';
import 'package:ecommerce_app/src/features/products/presentation/providers/product_detail_provider.dart';
import 'package:ecommerce_app/src/features/products/presentation/widgets/product_image.dart';
import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderItemRow extends ConsumerWidget {
  const OrderItemRow({
    super.key,
    required this.productId,
    required this.quantity,
  });

  final String productId;
  final int quantity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productDetailAsyncValue = ref.watch(productDetailProvider(productId));

    final spacing = context.spacing;
    final textTheme = Theme.of(context).textTheme;

    return AsyncValueWidget(
      asyncValue: productDetailAsyncValue,
      data: (product) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ColoredBox(
            color: Colors.white,
            child: SizedBox.square(
              dimension: 104,
              child: ProductImage(product: product),
            ),
          ),
          SizedBox(width: spacing.p16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  product.name,
                  style: textTheme.titleLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF2B282D),
                  ),
                ),
                SizedBox(height: spacing.p20),
                Text(
                  '数量: $quantity',
                  style: textTheme.titleMedium?.copyWith(
                    fontSize: 15,
                    color: const Color(0xFF2B282D),
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
