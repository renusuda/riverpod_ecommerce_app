import 'package:ecommerce_app/src/features/cart/presentation/providers/cart_provider.dart';
import 'package:ecommerce_app/src/routing/app_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartIconButton extends ConsumerWidget {
  const CartIconButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItemCount = ref
        .watch(cartProvider)
        .maybeWhen(data: (cart) => cart.items.length, orElse: () => 0);

    return IconButton(
      icon: Badge.count(
        count: cartItemCount,
        isLabelVisible: cartItemCount > 0,
        child: const Icon(Icons.shopping_cart),
      ),
      onPressed: () => context.goNamed(AppRoute.cart.name),
    );
  }
}
