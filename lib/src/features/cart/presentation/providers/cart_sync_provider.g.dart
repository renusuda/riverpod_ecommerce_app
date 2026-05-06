// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_sync_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cartSync)
final cartSyncProvider = CartSyncProvider._();

final class CartSyncProvider
    extends
        $FunctionalProvider<CartSyncUseCase, CartSyncUseCase, CartSyncUseCase>
    with $Provider<CartSyncUseCase> {
  CartSyncProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartSyncProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartSyncHash();

  @$internal
  @override
  $ProviderElement<CartSyncUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CartSyncUseCase create(Ref ref) {
    return cartSync(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CartSyncUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CartSyncUseCase>(value),
    );
  }
}

String _$cartSyncHash() => r'5f29c1156bc24f8fea82572005429e6d859c8f9a';
