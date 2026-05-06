import 'package:ecommerce_app/src/features/authentication/data/authentication_repository_provider.dart';
import 'package:ecommerce_app/src/features/orders/data/orders_repository_provider.dart';
import 'package:ecommerce_app/src/features/orders/domain/order.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'orders_provider.g.dart';

@riverpod
Future<List<Order>> orders(Ref ref) {
  ref.watch(authenticationStateChangesProvider);
  final user = ref.watch(authenticationRepositoryProvider).currentUser;
  if (user == null) return Future.value([]);

  return ref.watch(ordersRepositoryProvider).fetchOrders(user.uid);
}
