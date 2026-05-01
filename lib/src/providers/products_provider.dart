import 'package:ecommerce_app/src/data/products_repository.dart';
import 'package:ecommerce_app/src/domain/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_provider.g.dart';

@riverpod
ProductsRepository productsRepository(Ref ref) {
  return ProductsRepository();
}

@riverpod
List<Product> products(Ref ref) {
  final repository = ref.watch(productsRepositoryProvider);
  return repository.fetchProducts();
}
