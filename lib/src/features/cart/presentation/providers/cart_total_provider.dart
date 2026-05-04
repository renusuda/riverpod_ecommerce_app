import 'package:ecommerce_app/src/features/cart/presentation/providers/cart_provider.dart';
import 'package:ecommerce_app/src/features/cart/use_case/calculate_cart_total_use_case_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_total_provider.g.dart';

@riverpod
Future<int> cartTotal(Ref ref) async {
  final cart = await ref.watch(cartProvider.future);
  return ref.read(calculateCartTotalUseCaseProvider).execute(cart);
}
