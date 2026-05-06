import 'package:ecommerce_app/src/common_widgets/app_card.dart';
import 'package:go_router/go_router.dart';
import 'package:ecommerce_app/src/routing/app_route.dart';
import 'package:ecommerce_app/src/common_widgets/async_value_widget.dart';
import 'package:ecommerce_app/src/common_widgets/primary_button.dart';
import 'package:ecommerce_app/src/extensions/int_extensions.dart';
import 'package:ecommerce_app/src/features/cart/presentation/providers/cart_provider.dart';
import 'package:ecommerce_app/src/features/cart/presentation/providers/cart_total_provider.dart';
import 'package:ecommerce_app/src/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:ecommerce_app/src/features/cart/presentation/widgets/empty_cart_view.dart';
import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartAsyncValue = ref.watch(cartProvider);
    final cartTotalAsyncValue = ref.watch(cartTotalProvider);

    final spacing = context.spacing;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        foregroundColor: Colors.white,
        title: const Text('カート'),
        centerTitle: true,
      ),
      body: AsyncValueWidget(
        asyncValue: cartAsyncValue,
        data: (cart) => cart.items.isEmpty
            ? const EmptyCartView()
            : Column(
                children: [
                  Expanded(
                    child: ListView.separated(
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
                  ),
                  const Divider(height: 1),
                  ColoredBox(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(spacing.p24),
                      child: Column(
                        children: [
                          AsyncValueWidget(
                            asyncValue: cartTotalAsyncValue,
                            data: (total) => Text(
                              '合計: ¥${total.commaSeparated}',
                              style: textTheme.titleLarge,
                            ),
                          ),
                          SizedBox(height: spacing.p16),
                          PrimaryButton(
                            label: '購入する',
                            onPressed: () =>
                                context.goNamed(AppRoute.payment.name),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
