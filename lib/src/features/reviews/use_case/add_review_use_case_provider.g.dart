// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_review_use_case_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(addReviewUseCase)
final addReviewUseCaseProvider = AddReviewUseCaseProvider._();

final class AddReviewUseCaseProvider
    extends
        $FunctionalProvider<
          AddReviewUseCase,
          AddReviewUseCase,
          AddReviewUseCase
        >
    with $Provider<AddReviewUseCase> {
  AddReviewUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addReviewUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addReviewUseCaseHash();

  @$internal
  @override
  $ProviderElement<AddReviewUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AddReviewUseCase create(Ref ref) {
    return addReviewUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddReviewUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddReviewUseCase>(value),
    );
  }
}

String _$addReviewUseCaseHash() => r'78cf287f4e9fa7789ed584569d27ff055831ff86';
