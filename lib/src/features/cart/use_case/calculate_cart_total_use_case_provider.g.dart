// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculate_cart_total_use_case_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(calculateCartTotalUseCase)
final calculateCartTotalUseCaseProvider = CalculateCartTotalUseCaseProvider._();

final class CalculateCartTotalUseCaseProvider
    extends
        $FunctionalProvider<
          CalculateCartTotalUseCase,
          CalculateCartTotalUseCase,
          CalculateCartTotalUseCase
        >
    with $Provider<CalculateCartTotalUseCase> {
  CalculateCartTotalUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'calculateCartTotalUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$calculateCartTotalUseCaseHash();

  @$internal
  @override
  $ProviderElement<CalculateCartTotalUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CalculateCartTotalUseCase create(Ref ref) {
    return calculateCartTotalUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CalculateCartTotalUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CalculateCartTotalUseCase>(value),
    );
  }
}

String _$calculateCartTotalUseCaseHash() =>
    r'3cefeaf9d14b88a7a78323e9122445e0b22546ef';
