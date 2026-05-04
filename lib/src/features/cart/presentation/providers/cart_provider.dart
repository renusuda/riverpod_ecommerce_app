import 'package:ecommerce_app/src/features/cart/data/cart_repository_provider.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart.dart' as domain;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
class Cart extends _$Cart {
  @override
  Future<domain.Cart> build() async {
    final repository = ref.watch(cartRepositoryProvider);
    return repository.fetchCart();
  }

  Future<void> add(String productId, int quantity) async {
    await ref.read(cartRepositoryProvider).addToCart(productId, quantity);
    if (ref.mounted) ref.invalidateSelf();
  }

  Future<void> remove(String productId) async {
    await ref.read(cartRepositoryProvider).removeFromCart(productId);
    ref.invalidateSelf();
  }
}
