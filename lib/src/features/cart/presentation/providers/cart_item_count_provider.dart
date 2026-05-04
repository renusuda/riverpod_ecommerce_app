import 'package:ecommerce_app/src/features/cart/presentation/providers/cart_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_item_count_provider.g.dart';

@riverpod
int cartItemCount(Ref ref) {
  return ref
      .watch(cartProvider)
      .maybeWhen(data: (cart) => cart.items.length, orElse: () => 0);
}
