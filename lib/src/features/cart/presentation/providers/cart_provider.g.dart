// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cart)
final cartProvider = CartProvider._();

final class CartProvider extends $FunctionalProvider<Cart, Cart, Cart>
    with $Provider<Cart> {
  CartProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartHash();

  @$internal
  @override
  $ProviderElement<Cart> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Cart create(Ref ref) {
    return cart(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Cart value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Cart>(value),
    );
  }
}

String _$cartHash() => r'45df79eb3c2a0e5aba596de2a6ac679e93405c51';
