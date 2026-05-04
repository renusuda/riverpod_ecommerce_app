import 'package:ecommerce_app/src/features/cart/domain/cart.dart';

abstract interface class CartLocalDataSource {
  Future<Cart> fetchCart();

  Future<void> addToCart(String productId, int quantity);

  Future<void> removeFromCart(String productId);

  Stream<Cart> watchCart();
}
