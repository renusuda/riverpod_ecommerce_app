import 'package:ecommerce_app/src/common_widgets/quantity_stepper.dart';
import 'package:ecommerce_app/src/extensions/int_extensions.dart';
import 'package:ecommerce_app/src/features/cart/presentation/providers/cart_product_detail_provider.dart';
import 'package:ecommerce_app/src/features/cart/presentation/providers/cart_provider.dart';
import 'package:ecommerce_app/src/features/products/presentation/widgets/product_image.dart';
import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartItemCard extends ConsumerWidget {
  const CartItemCard({
    required this.productId,
    required this.quantity,
    super.key,
  });

  final String productId;
  final int quantity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsyncValue = ref.watch(cartProductDetailProvider(productId));
    final spacing = context.spacing;
    final textTheme = Theme.of(context).textTheme;

    return productAsyncValue.when(
      data: (product) {
        return Row(
          children: [
            SizedBox.square(
              dimension: 100,
              child: ProductImage(product: product),
            ),
            SizedBox(width: spacing.p32),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(product.name, style: textTheme.headlineSmall),
                  SizedBox(height: spacing.p24),
                  Text(
                    product.price.commaSeparated,
                    style: textTheme.headlineSmall,
                  ),
                  SizedBox(height: spacing.p24),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        QuantityStepper(
                          quantity: quantity,
                          onIncrement: () =>
                              ref.read(cartProvider.notifier).add(productId, 1),
                          onDecrement: () => ref
                              .read(cartProvider.notifier)
                              .add(productId, -1),
                          maxQuantity: product.stockQuantity,
                        ),
                        SizedBox(width: spacing.p8),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Color(0xFFD62727),
                          ),
                          onPressed: () =>
                              ref.read(cartProvider.notifier).remove(productId),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
      loading: () {
        return const SizedBox(
          height: 100,
          child: Center(child: CircularProgressIndicator()),
        );
      },
      error: (_, _) {
        return SizedBox(
          height: 100,
          child: Center(
            child: Text('商品情報を取得できませんでした', style: textTheme.bodyLarge),
          ),
        );
      },
    );
  }
}
