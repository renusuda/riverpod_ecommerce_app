import 'package:ecommerce_app/src/features/cart/data/local/cart_local_data_source.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart.dart';

class CartRepository {
  const CartRepository({required CartLocalDataSource localDataSource})
    : _localDataSource = localDataSource;

  final CartLocalDataSource _localDataSource;

  Future<Cart> fetchCart() {
    return _localDataSource.fetchCart();
  }

  Future<void> addToCart(String productId, int quantity) {
    return _localDataSource.addToCart(productId, quantity);
  }

  Future<void> removeFromCart(String productId) {
    return _localDataSource.removeFromCart(productId);
  }
}
