import 'package:ecommerce_app/src/features/cart/domain/cart.dart';

abstract interface class CartLocalDataSource {
  Cart fetchCart();
}
