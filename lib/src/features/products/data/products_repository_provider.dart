import 'package:ecommerce_app/src/features/products/data/products_repository.dart';
import 'package:ecommerce_app/src/features/products/data/remote/fake_products_data_source.dart';
import 'package:ecommerce_app/src/features/products/data/remote/products_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_repository_provider.g.dart';

@Riverpod(keepAlive: true)
ProductsDataSource productsDataSource(Ref ref) {
  return FakeProductsDataSource();
}

@Riverpod(keepAlive: true)
ProductsRepository productsRepository(Ref ref) {
  final remoteDataSource = ref.watch(productsDataSourceProvider);
  return ProductsRepository(remoteDataSource: remoteDataSource);
}
