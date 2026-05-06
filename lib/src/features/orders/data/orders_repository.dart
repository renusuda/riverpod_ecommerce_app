import 'package:ecommerce_app/src/features/orders/data/remote/orders_remote_data_source.dart';
import 'package:ecommerce_app/src/features/orders/domain/order.dart';

class OrdersRepository {
  const OrdersRepository({required OrdersRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  final OrdersRemoteDataSource _remoteDataSource;

  Future<List<Order>> fetchOrders(String userId) {
    return _remoteDataSource.fetchOrders(userId);
  }

  Future<void> addOrder(Order order) {
    return _remoteDataSource.addOrder(order);
  }
}
