import 'package:ecommerce_app/src/features/cart/use_case/calculate_cart_total_use_case.dart';
import 'package:ecommerce_app/src/features/products/data/products_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calculate_cart_total_use_case_provider.g.dart';

@riverpod
CalculateCartTotalUseCase calculateCartTotalUseCase(Ref ref) {
  final repository = ref.watch(productsRepositoryProvider);
  return CalculateCartTotalUseCase(repository: repository);
}
