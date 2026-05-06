import 'package:ecommerce_app/src/features/orders/data/remote/orders_remote_data_source.dart';
import 'package:ecommerce_app/src/features/orders/domain/order.dart';

class FakeOrdersRemoteDataSource implements OrdersRemoteDataSource {
  final List<Order> _orders = [
    Order(
      id: 'order-1',
      userId: 'moc.tset@tset',
      orderDate: DateTime(2026, 5, 6),
      orderStatus: OrderStatus.confirmed,
      items: {'3': 1},
      total: 2800,
    ),
    Order(
      id: 'order-2',
      userId: 'moc.tset@tset',
      orderDate: DateTime(2026, 5, 6),
      orderStatus: OrderStatus.confirmed,
      items: {'1': 1, '2': 2},
      total: 6900,
    ),
  ];
  @override
  Future<List<Order>> fetchOrders() async {
    return _orders;
  }
}
