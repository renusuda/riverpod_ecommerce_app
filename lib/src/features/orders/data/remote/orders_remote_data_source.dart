import 'package:ecommerce_app/src/features/orders/domain/order.dart';

abstract interface class OrdersRemoteDataSource {
  Future<List<Order>> fetchOrders();

  Future<void> addOrder(Order order);
}
