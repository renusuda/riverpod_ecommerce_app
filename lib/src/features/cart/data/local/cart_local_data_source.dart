import 'package:ecommerce_app/src/features/cart/domain/cart.dart';

abstract interface class CartLocalDataSource {
  Future<void> addToCart(String productId, int quantity);

  Future<void> removeFromCart(String productId);

  Future<void> clearCart();

  Stream<Cart> watchCart();
}
