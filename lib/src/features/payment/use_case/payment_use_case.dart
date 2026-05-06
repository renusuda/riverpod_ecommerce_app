import 'package:ecommerce_app/src/features/authentication/data/authentication_repository.dart';
import 'package:ecommerce_app/src/features/cart/data/cart_repository.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart.dart';
import 'package:ecommerce_app/src/features/cart/use_case/calculate_cart_total_use_case.dart';
import 'package:ecommerce_app/src/features/orders/data/orders_repository.dart';
import 'package:ecommerce_app/src/features/orders/domain/order.dart';

class PaymentUseCase {
  const PaymentUseCase({
    required AuthenticationRepository authenticationRepository,
    required CartRepository cartRepository,
    required OrdersRepository ordersRepository,
    required CalculateCartTotalUseCase calculateCartTotalUseCase,
  }) : _authenticationRepository = authenticationRepository,
       _cartRepository = cartRepository,
       _ordersRepository = ordersRepository,
       _calculateCartTotalUseCase = calculateCartTotalUseCase;

  final AuthenticationRepository _authenticationRepository;
  final CartRepository _cartRepository;
  final OrdersRepository _ordersRepository;
  final CalculateCartTotalUseCase _calculateCartTotalUseCase;

  Future<void> execute(Cart cart) async {
    if (cart.items.isEmpty) return;

    final user = _authenticationRepository.currentUser;
    if (user == null) {
      throw StateError('支払いはログインユーザーで行う必要があります。');
    }

    final total = await _calculateCartTotalUseCase.execute(cart);
    final order = Order(
      id: 'order-${DateTime.now().microsecondsSinceEpoch}',
      userId: user.uid,
      items: {for (final item in cart.items) item.productId: item.quantity},
      orderStatus: OrderStatus.confirmed,
      orderDate: DateTime.now(),
      total: total.toDouble(),
    );

    await _ordersRepository.addOrder(order);
    await _cartRepository.clearCart(userId: user.uid);
  }
}
