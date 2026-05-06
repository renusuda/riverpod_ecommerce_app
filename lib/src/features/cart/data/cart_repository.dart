import 'package:ecommerce_app/src/features/cart/data/local/cart_local_data_source.dart';
import 'package:ecommerce_app/src/features/cart/data/remote/cart_remote_data_source.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart_item.dart';

class CartRepository {
  const CartRepository({
    required CartLocalDataSource localDataSource,
    required CartRemoteDataSource remoteDataSource,
  }) : _localDataSource = localDataSource,
       _remoteDataSource = remoteDataSource;

  final CartLocalDataSource _localDataSource;
  final CartRemoteDataSource _remoteDataSource;

  Future<void> addToCart(String productId, int quantity, {String? userId}) {
    if (userId == null) {
      return _localDataSource.addToCart(productId, quantity);
    }
    return _remoteDataSource.addToCart(userId, productId, quantity);
  }

  Future<void> removeFromCart(String productId, {String? userId}) {
    if (userId == null) {
      return _localDataSource.removeFromCart(productId);
    }
    return _remoteDataSource.removeFromCart(userId, productId);
  }

  Future<void> clearCart({String? userId}) {
    if (userId == null) {
      return _localDataSource.clearCart();
    }
    return _remoteDataSource.clearCart(userId);
  }

  Stream<Cart> watchCart({String? userId}) {
    if (userId == null) {
      return _localDataSource.watchCart();
    }
    return _remoteDataSource.watchCart(userId);
  }

  Future<void> migrateLocalCartToRemote(String userId) async {
    final localCart = await _localDataSource.watchCart().first;
    if (localCart.items.isEmpty) return;

    final remoteCart = await _remoteDataSource.fetchCart(userId);
    final quantitiesByProductId = <String, int>{};

    for (final item in remoteCart.items) {
      if (item.quantity <= 0) continue;
      quantitiesByProductId[item.productId] =
          (quantitiesByProductId[item.productId] ?? 0) + item.quantity;
    }

    for (final item in localCart.items) {
      if (item.quantity <= 0) continue;
      quantitiesByProductId[item.productId] =
          (quantitiesByProductId[item.productId] ?? 0) + item.quantity;
    }

    final mergedItems = quantitiesByProductId.entries
        .map((entry) => CartItem(productId: entry.key, quantity: entry.value))
        .toList(growable: false);

    await _remoteDataSource.saveCart(userId, Cart(items: mergedItems));
    await _localDataSource.clearCart();
  }
}
