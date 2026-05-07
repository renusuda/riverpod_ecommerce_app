import 'package:ecommerce_app/src/features/orders/domain/order.dart';

extension OrderListExtension on List<Order> {
  Order? latestOrderIncluding(String productId) {
    final purchasedOrders = where(
      (order) => order.items.containsKey(productId),
    ).toList()..sort((a, b) => b.orderDate.compareTo(a.orderDate));

    return purchasedOrders.firstOrNull;
  }
}
