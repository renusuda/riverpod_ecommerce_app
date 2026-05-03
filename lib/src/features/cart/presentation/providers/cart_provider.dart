import 'package:ecommerce_app/src/features/cart/data/cart_repository_provider.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
Cart cart(Ref ref) {
  final repository = ref.watch(cartRepositoryProvider);
  return repository.fetchCart();
}
