import 'package:ecommerce_app/src/features/authentication/data/authentication_repository_provider.dart';
import 'package:ecommerce_app/src/features/cart/data/cart_repository_provider.dart';
import 'package:ecommerce_app/src/features/cart/use_case/calculate_cart_total_use_case_provider.dart';
import 'package:ecommerce_app/src/features/orders/data/orders_repository_provider.dart';
import 'package:ecommerce_app/src/features/payment/use_case/payment_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_use_case_provider.g.dart';

@riverpod
PaymentUseCase paymentUseCase(Ref ref) {
  return PaymentUseCase(
    authenticationRepository: ref.watch(authenticationRepositoryProvider),
    cartRepository: ref.watch(cartRepositoryProvider),
    ordersRepository: ref.watch(ordersRepositoryProvider),
    calculateCartTotalUseCase: ref.watch(calculateCartTotalUseCaseProvider),
  );
}
