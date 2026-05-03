import 'package:ecommerce_app/src/features/cart/data/local/cart_local_data_source.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart_item.dart';

class FakeCartLocalDataSource implements CartLocalDataSource {
  @override
  Future<Cart> fetchCart() async {
    await Future.delayed(const Duration(seconds: 1));

    const cartItems = <CartItem>[
      CartItem(productId: '1', quantity: 2),
      CartItem(productId: '2', quantity: 3),
    ];

    return const Cart(items: cartItems);
  }
}
