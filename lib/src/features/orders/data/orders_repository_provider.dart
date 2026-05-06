import 'package:ecommerce_app/src/features/orders/data/orders_repository.dart';
import 'package:ecommerce_app/src/features/orders/data/remote/fake_orders_remote_data_source.dart';
import 'package:ecommerce_app/src/features/orders/data/remote/orders_remote_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'orders_repository_provider.g.dart';

@Riverpod(keepAlive: true)
OrdersRemoteDataSource ordersRemoteDataSource(Ref ref) {
  return FakeOrdersRemoteDataSource();
}

@Riverpod(keepAlive: true)
OrdersRepository ordersRepository(Ref ref) {
  final remoteDataSource = ref.watch(ordersRemoteDataSourceProvider);
  return OrdersRepository(remoteDataSource: remoteDataSource);
}
