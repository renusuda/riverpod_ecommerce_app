import 'package:ecommerce_app/src/features/orders/data/orders_repository_provider.dart';
import 'package:ecommerce_app/src/features/orders/domain/order.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'orders_provider.g.dart';

@riverpod
Future<List<Order>> orders(Ref ref) {
  return ref.watch(ordersRepositoryProvider).fetchOrders();
}
