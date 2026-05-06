import 'package:ecommerce_app/src/features/cart/domain/cart.dart';

abstract interface class CartRemoteDataSource {
  Future<void> addToCart(String userId, String productId, int quantity);

  Future<Cart> fetchCart(String userId);

  Future<void> removeFromCart(String userId, String productId);

  Future<void> saveCart(String userId, Cart cart);

  Stream<Cart> watchCart(String userId);
}
