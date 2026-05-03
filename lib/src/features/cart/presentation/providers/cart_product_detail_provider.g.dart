// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cartProductDetail)
final cartProductDetailProvider = CartProductDetailFamily._();

final class CartProductDetailProvider
    extends $FunctionalProvider<AsyncValue<Product>, Product, FutureOr<Product>>
    with $FutureModifier<Product>, $FutureProvider<Product> {
  CartProductDetailProvider._({
    required CartProductDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'cartProductDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cartProductDetailHash();

  @override
  String toString() {
    return r'cartProductDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Product> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Product> create(Ref ref) {
    final argument = this.argument as String;
    return cartProductDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CartProductDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cartProductDetailHash() => r'9b901002f16c51d03f2b9348dc8d697e65990a1a';

final class CartProductDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Product>, String> {
  CartProductDetailFamily._()
    : super(
        retry: null,
        name: r'cartProductDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CartProductDetailProvider call(String id) =>
      CartProductDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'cartProductDetailProvider';
}
