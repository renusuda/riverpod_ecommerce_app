import 'package:ecommerce_app/src/common_widgets/app_card.dart';
import 'package:ecommerce_app/src/features/cart/presentation/providers/cart_provider.dart';
import 'package:ecommerce_app/src/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:ecommerce_app/src/features/cart/presentation/widgets/empty_cart_view.dart';
import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
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
          ? const EmptyCartView()
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
                  child: CartItemCard(
                    productId: item.productId,
                    quantity: item.quantity,
                  ),
                );
              },
            ),
    );
  }
}
