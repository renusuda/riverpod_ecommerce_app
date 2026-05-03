import 'package:ecommerce_app/src/features/cart/data/cart_repository_provider.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
Future<Cart> cart(Ref ref) async {
  final repository = ref.watch(cartRepositoryProvider);
  return repository.fetchCart();
}
