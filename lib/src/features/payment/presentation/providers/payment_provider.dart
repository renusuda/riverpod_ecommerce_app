import 'package:ecommerce_app/src/features/cart/domain/cart.dart' as domain;
import 'package:ecommerce_app/src/features/cart/presentation/providers/cart_provider.dart';
import 'package:ecommerce_app/src/features/orders/presentation/providers/orders_provider.dart';
import 'package:ecommerce_app/src/features/payment/use_case/payment_use_case_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_provider.g.dart';

@riverpod
class Payment extends _$Payment {
  @override
  FutureOr<void> build() {}

  Future<void> complete(domain.Cart cart) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(paymentUseCaseProvider).execute(cart);
      ref.invalidate(ordersProvider);
      ref.invalidate(cartProvider);
    });
  }
}
