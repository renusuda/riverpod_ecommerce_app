import 'package:ecommerce_app/src/data/remote/fake_products_data_source.dart';
import 'package:ecommerce_app/src/data/remote/products_data_source.dart';
import 'package:ecommerce_app/src/data/products_repository.dart';
import 'package:ecommerce_app/src/domain/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_provider.g.dart';

@riverpod
ProductsDataSource productsDataSource(Ref ref) {
  return FakeProductsDataSource();
}

@riverpod
ProductsRepository productsRepository(Ref ref) {
  final remoteDataSource = ref.watch(productsDataSourceProvider);
  return ProductsRepository(remoteDataSource: remoteDataSource);
}

@riverpod
List<Product> products(Ref ref) {
  final repository = ref.watch(productsRepositoryProvider);
  return repository.fetchProducts();
}
