import 'package:ecommerce_app/src/common_widgets/app_card.dart';
import 'package:ecommerce_app/src/common_widgets/async_value_widget.dart';
import 'package:ecommerce_app/src/common_widgets/primary_button.dart';
import 'package:ecommerce_app/src/common_widgets/quantity_stepper.dart';
import 'package:ecommerce_app/src/extensions/int_extensions.dart';
import 'package:ecommerce_app/src/features/cart/presentation/providers/cart_provider.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:ecommerce_app/src/features/products/presentation/widgets/app_bar_menu_button.dart';
import 'package:ecommerce_app/src/features/products/presentation/widgets/cart_icon_button.dart';
import 'package:ecommerce_app/src/features/products/presentation/providers/product_detail_provider.dart';
import 'package:ecommerce_app/src/features/products/presentation/widgets/product_image.dart';
import 'package:ecommerce_app/src/features/products/presentation/widgets/product_rating_bar.dart';
import 'package:ecommerce_app/src/features/reviews/presentation/widgets/review_list.dart';
import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductDetailPage extends ConsumerWidget {
  const ProductDetailPage({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productDetailAsyncValue = ref.watch(productDetailProvider(productId));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        foregroundColor: Colors.white,
        title: const Text('ショップ'),
        centerTitle: false,
        actions: [const CartIconButton(), const AppBarMenuButton()],
      ),
      body: AsyncValueWidget(
        asyncValue: productDetailAsyncValue,
        data: (product) => _ProductDetailView(product: product),
      ),
    );
  }
}

class _ProductDetailView extends HookConsumerWidget {
  const _ProductDetailView({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantity = useState(1);
    final spacing = context.spacing;
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: EdgeInsets.all(spacing.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCard(
            child: SizedBox(
              height: 250,
              width: double.infinity,
              child: ProductImage(product: product),
            ),
          ),
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
                Row(
                  children: [
                    Text('数量:', style: textTheme.bodyLarge),
                    const Spacer(),
                    QuantityStepper(
                      quantity: quantity.value,
                      onIncrement: () => quantity.value++,
                      onDecrement: () => quantity.value--,
                      maxQuantity: product.stockQuantity,
                    ),
                  ],
                ),
                const Divider(height: 32),
                PrimaryButton(
                  label: product.stockQuantity == 0 ? '在庫切れ' : 'カートに追加',
                  onPressed: product.stockQuantity == 0
                      ? null
                      : () => ref
                            .read(cartProvider.notifier)
                            .add(product.id, quantity.value),
                ),
              ],
            ),
          ),
          ReviewList(reviews: product.reviews),
        ],
      ),
    );
  }
}
