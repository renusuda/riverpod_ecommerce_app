import 'package:ecommerce_app/src/features/products/data/products_repository.dart';
import 'package:ecommerce_app/src/features/products/data/remote/fake_products_data_source.dart';
import 'package:ecommerce_app/src/features/products/data/remote/products_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_repository_provider.g.dart';

@riverpod
ProductsDataSource productsDataSource(Ref ref) {
  return FakeProductsDataSource();
}

@riverpod
ProductsRepository productsRepository(Ref ref) {
  final remoteDataSource = ref.watch(productsDataSourceProvider);
  return ProductsRepository(remoteDataSource: remoteDataSource);
}
