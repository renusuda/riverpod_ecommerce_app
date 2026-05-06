import 'package:ecommerce_app/src/features/authentication/data/authentication_repository_provider.dart';
import 'package:ecommerce_app/src/features/cart/data/cart_repository_provider.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart.dart' as domain;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
class Cart extends _$Cart {
  @override
  Stream<domain.Cart> build() {
    ref.watch(authenticationStateChangesProvider);
    final user = ref.watch(authenticationRepositoryProvider).currentUser;
    return ref.watch(cartRepositoryProvider).watchCart(userId: user?.uid);
  }

  Future<void> add(String productId, int quantity) async {
    final user = ref.read(authenticationRepositoryProvider).currentUser;
    await ref
        .read(cartRepositoryProvider)
        .addToCart(productId, quantity, userId: user?.uid);
  }

  Future<void> remove(String productId) async {
    final user = ref.read(authenticationRepositoryProvider).currentUser;
    await ref
        .read(cartRepositoryProvider)
        .removeFromCart(productId, userId: user?.uid);
  }
}
