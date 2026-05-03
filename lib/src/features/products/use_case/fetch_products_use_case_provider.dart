import 'package:ecommerce_app/src/features/products/data/products_repository_provider.dart';
import 'package:ecommerce_app/src/features/products/use_case/fetch_products_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_products_use_case_provider.g.dart';

@riverpod
FetchProductsUseCase fetchProductsUseCase(Ref ref) {
  final repository = ref.watch(productsRepositoryProvider);
  return FetchProductsUseCase(repository: repository);
}
