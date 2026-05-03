import 'package:ecommerce_app/src/features/cart/data/cart_repository.dart';
import 'package:ecommerce_app/src/features/cart/data/local/cart_local_data_source.dart';
import 'package:ecommerce_app/src/features/cart/data/local/fake_cart_local_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_repository_provider.g.dart';

@Riverpod(keepAlive: true)
CartLocalDataSource cartLocalDataSource(Ref ref) {
  return FakeCartLocalDataSource();
}

@Riverpod(keepAlive: true)
CartRepository cartRepository(Ref ref) {
  final localDataSource = ref.watch(cartLocalDataSourceProvider);
  return CartRepository(localDataSource: localDataSource);
}
