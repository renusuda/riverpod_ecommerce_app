// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Cart)
final cartProvider = CartProvider._();

final class CartProvider extends $AsyncNotifierProvider<Cart, domain.Cart> {
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
  Cart create() => Cart();
}

String _$cartHash() => r'b6f8e0eeba474314a9ef9738b59cde4d2aace174';

abstract class _$Cart extends $AsyncNotifier<domain.Cart> {
  FutureOr<domain.Cart> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<domain.Cart>, domain.Cart>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<domain.Cart>, domain.Cart>,
              AsyncValue<domain.Cart>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
