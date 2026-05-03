import 'package:ecommerce_app/src/features/products/data/products_repository.dart';
import 'package:ecommerce_app/src/features/products/data/remote/fake_products_remote_data_source.dart';
import 'package:ecommerce_app/src/features/products/data/remote/products_remote_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_repository_provider.g.dart';

@Riverpod(keepAlive: true)
ProductsRemoteDataSource productsRemoteDataSource(Ref ref) {
  return FakeProductsRemoteDataSource();
}

@Riverpod(keepAlive: true)
ProductsRepository productsRepository(Ref ref) {
  final remoteDataSource = ref.watch(productsRemoteDataSourceProvider);
  return ProductsRepository(remoteDataSource: remoteDataSource);
}
