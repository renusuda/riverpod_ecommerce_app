import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:ecommerce_app/src/features/products/use_case/fetch_products_use_case_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_provider.g.dart';

@riverpod
Future<List<Product>> products(Ref ref, String searchText) {
  final useCase = ref.watch(fetchProductsUseCaseProvider);
  return useCase.execute(searchText);
}
