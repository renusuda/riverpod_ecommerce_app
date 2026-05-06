// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_use_case_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(paymentUseCase)
final paymentUseCaseProvider = PaymentUseCaseProvider._();

final class PaymentUseCaseProvider
    extends $FunctionalProvider<PaymentUseCase, PaymentUseCase, PaymentUseCase>
    with $Provider<PaymentUseCase> {
  PaymentUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentUseCaseHash();

  @$internal
  @override
  $ProviderElement<PaymentUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PaymentUseCase create(Ref ref) {
    return paymentUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PaymentUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PaymentUseCase>(value),
    );
  }
}

String _$paymentUseCaseHash() => r'd260a941c1d5f5a292962fd7ccf7a3f13af00f88';
