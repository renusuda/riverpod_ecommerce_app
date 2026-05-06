import 'package:ecommerce_app/src/features/orders/data/remote/orders_remote_data_source.dart';
import 'package:ecommerce_app/src/features/orders/domain/order.dart';

class FakeOrdersRemoteDataSource implements OrdersRemoteDataSource {
  final List<Order> _orders = [];

  @override
  Future<List<Order>> fetchOrders(String userId) async {
    return _orders.where((order) => order.userId == userId).toList();
  }

  @override
  Future<void> addOrder(Order order) async {
    _orders.insert(0, order);
  }
}
