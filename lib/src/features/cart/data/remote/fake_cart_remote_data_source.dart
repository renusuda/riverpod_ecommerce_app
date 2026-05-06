import 'dart:async';

import 'package:ecommerce_app/src/features/cart/data/remote/cart_remote_data_source.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart_item.dart';

class FakeCartRemoteDataSource implements CartRemoteDataSource {
  final Map<String, Cart> _carts = {};
  final Map<String, StreamController<Cart>> _cartControllers = {};

  @override
  Future<void> addToCart(String userId, String productId, int quantity) async {
    final cart = await fetchCart(userId);
    final items = [...cart.items];
    final index = items.indexWhere((item) => item.productId == productId);
    final currentQuantity = index == -1 ? 0 : items[index].quantity;
    final newQuantity = currentQuantity + quantity;

    if (newQuantity <= 0) {
      items.removeWhere((item) => item.productId == productId);
    } else if (index == -1) {
      items.add(CartItem(productId: productId, quantity: newQuantity));
    } else {
      items[index] = CartItem(productId: productId, quantity: newQuantity);
    }

    await saveCart(userId, Cart(items: items));
  }

  @override
  Future<Cart> fetchCart(String userId) async {
    await Future.delayed(const Duration(seconds: 1));
    return _carts[userId] ?? const Cart();
  }

  @override
  Future<void> removeFromCart(String userId, String productId) async {
    final cart = await fetchCart(userId);
    final items = cart.items
        .where((item) => item.productId != productId)
        .toList(growable: false);
    await saveCart(userId, Cart(items: items));
  }

  @override
  Future<void> saveCart(String userId, Cart cart) async {
    await Future.delayed(const Duration(seconds: 1));
    _carts[userId] = cart;
    _controller(userId).add(cart);
  }

  @override
  Stream<Cart> watchCart(String userId) async* {
    yield await fetchCart(userId);
    yield* _controller(userId).stream;
  }

  StreamController<Cart> _controller(String userId) {
    return _cartControllers.putIfAbsent(
      userId,
      () => StreamController<Cart>.broadcast(),
    );
  }
}
