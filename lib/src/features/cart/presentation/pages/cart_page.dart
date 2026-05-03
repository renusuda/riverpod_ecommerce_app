import 'package:ecommerce_app/src/common_widgets/app_card.dart';
import 'package:ecommerce_app/src/common_widgets/primary_button.dart';
import 'package:ecommerce_app/src/common_widgets/quantity_stepper.dart';
import 'package:ecommerce_app/src/extensions/int_extensions.dart';
import 'package:ecommerce_app/src/features/cart/presentation/providers/cart_provider.dart';
import 'package:ecommerce_app/src/features/products/presentation/providers/product_detail_provider.dart';
import 'package:ecommerce_app/src/features/products/presentation/widgets/product_image.dart';
import 'package:ecommerce_app/src/routing/app_route.dart';
import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    final spacing = context.spacing;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        foregroundColor: Colors.white,
        title: const Text('カート'),
        centerTitle: true,
      ),
      body: cart.items.isEmpty
          ? const _EmptyCartView()
          : ListView.separated(
              padding: EdgeInsets.symmetric(
                vertical: spacing.p24,
                horizontal: spacing.p24,
              ),
              itemCount: cart.items.length,
              separatorBuilder: (_, _) => SizedBox(height: spacing.p12),
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return AppCard(
                  child: _CartItemCard(
                    productId: item.productId,
                    quantity: item.quantity,
                  ),
                );
              },
            ),
    );
  }
}

class _CartItemCard extends ConsumerWidget {
  const _CartItemCard({required this.productId, required this.quantity});

  final String productId;
  final int quantity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsyncValue = ref.watch(productDetailProvider(productId));
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
                          onIncrement: () {},
                          onDecrement: () {},
                          maxQuantity: product.stockQuantity,
                        ),
                        SizedBox(width: spacing.p8),
                        const Icon(Icons.delete, color: Color(0xFFD62727)),
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

class _EmptyCartView extends StatelessWidget {
  const _EmptyCartView();

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('カートは空です。', style: textTheme.titleLarge),
          SizedBox(height: spacing.p16),
          PrimaryButton(
            label: 'ホーム画面に戻る',
            onPressed: () => context.goNamed(AppRoute.home.name),
            expand: false,
          ),
        ],
      ),
    );
  }
}
