// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_products_use_case_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchProductsUseCase)
final fetchProductsUseCaseProvider = FetchProductsUseCaseProvider._();

final class FetchProductsUseCaseProvider
    extends
        $FunctionalProvider<
          FetchProductsUseCase,
          FetchProductsUseCase,
          FetchProductsUseCase
        >
    with $Provider<FetchProductsUseCase> {
  FetchProductsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchProductsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchProductsUseCaseHash();

  @$internal
  @override
  $ProviderElement<FetchProductsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FetchProductsUseCase create(Ref ref) {
    return fetchProductsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FetchProductsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FetchProductsUseCase>(value),
    );
  }
}

String _$fetchProductsUseCaseHash() =>
    r'f8076153b0c6b284bd19171189c9d02a6584fad7';
