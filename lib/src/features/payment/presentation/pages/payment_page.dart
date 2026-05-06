import 'package:ecommerce_app/src/common_widgets/async_value_widget.dart';
import 'package:ecommerce_app/src/common_widgets/primary_button.dart';
import 'package:ecommerce_app/src/extensions/async_value_ui.dart';
import 'package:ecommerce_app/src/extensions/int_extensions.dart';
import 'package:ecommerce_app/src/features/cart/presentation/providers/cart_product_detail_provider.dart';
import 'package:ecommerce_app/src/features/cart/presentation/providers/cart_provider.dart';
import 'package:ecommerce_app/src/features/cart/presentation/providers/cart_total_provider.dart';
import 'package:ecommerce_app/src/features/cart/presentation/widgets/empty_cart_view.dart';
import 'package:ecommerce_app/src/features/payment/presentation/providers/payment_provider.dart';
import 'package:ecommerce_app/src/features/products/presentation/widgets/product_image.dart';
import 'package:ecommerce_app/src/routing/app_route.dart';
import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PaymentPage extends ConsumerWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentState = ref.watch(paymentProvider);
    final cartAsyncValue = ref.watch(cartProvider);
    final cartTotalAsyncValue = ref.watch(cartTotalProvider);

    final spacing = context.spacing;
    final textTheme = Theme.of(context).textTheme;

    ref.listen(paymentProvider, (previous, next) {
      if (previous?.isLoading != true) return;

      if (next.hasError) {
        next.showAlertDialogOnError(context);
        return;
      }

      if (!next.isLoading) {
        context.goNamed(AppRoute.orders.name);
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFFFCF6FE),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        foregroundColor: Colors.white,
        title: const Text('支払い'),
        centerTitle: true,
      ),
      body: AsyncValueWidget(
        asyncValue: cartAsyncValue,
        data: (cart) {
          if (cart.items.isEmpty) return const EmptyCartView();

          return Column(
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
                    return _PaymentItemCard(
                      productId: item.productId,
                      quantity: item.quantity,
                    );
                  },
                ),
              ),
              const Divider(height: 1),
              ColoredBox(
                color: Colors.white,
                child: SafeArea(
                  top: false,
                  child: Padding(
                    padding: EdgeInsets.all(spacing.p24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AsyncValueWidget(
                          asyncValue: cartTotalAsyncValue,
                          data: (total) => Text(
                            '合計: ¥${total.commaSeparated}',
                            style: textTheme.headlineSmall,
                          ),
                        ),
                        SizedBox(height: spacing.p16),
                        PrimaryButton(
                          label: '支払う',
                          isLoading: paymentState.isLoading,
                          onPressed: paymentState.isLoading
                              ? null
                              : () => ref
                                    .read(paymentProvider.notifier)
                                    .complete(cart),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _PaymentItemCard extends ConsumerWidget {
  const _PaymentItemCard({required this.productId, required this.quantity});

  final String productId;
  final int quantity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsyncValue = ref.watch(cartProductDetailProvider(productId));
    final spacing = context.spacing;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      color: const Color(0xFFFBF6FE),
      elevation: 1,
      shadowColor: const Color(0x26000000),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: const BorderSide(color: Color(0xFFF0EAF3)),
      ),
      child: Padding(
        padding: EdgeInsets.all(spacing.p24),
        child: productAsyncValue.when(
          data: (product) => Row(
            children: [
              SizedBox.square(
                dimension: 112,
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
                      '¥${product.price.commaSeparated}',
                      style: textTheme.headlineSmall,
                    ),
                    SizedBox(height: spacing.p24),
                    Text('数量: $quantity', style: textTheme.titleMedium),
                  ],
                ),
              ),
            ],
          ),
          loading: () => const SizedBox(
            height: 112,
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (_, _) => SizedBox(
            height: 112,
            child: Center(
              child: Text('商品情報を取得できませんでした', style: textTheme.bodyLarge),
            ),
          ),
        ),
      ),
    );
  }
}
