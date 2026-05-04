import 'package:ecommerce_app/src/routing/app_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartIconButton extends StatelessWidget {
  const CartIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.shopping_cart),
      onPressed: () => context.goNamed(AppRoute.cart.name),
    );
  }
}
