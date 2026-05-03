import 'package:ecommerce_app/src/features/cart/domain/cart_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart.freezed.dart';

@freezed
sealed class Cart with _$Cart {
  const factory Cart({@Default([]) List<CartItem> items}) = _Cart;
}
