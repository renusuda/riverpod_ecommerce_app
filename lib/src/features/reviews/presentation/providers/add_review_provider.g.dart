// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_review_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddReview)
final addReviewProvider = AddReviewProvider._();

final class AddReviewProvider extends $AsyncNotifierProvider<AddReview, void> {
  AddReviewProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addReviewProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addReviewHash();

  @$internal
  @override
  AddReview create() => AddReview();
}

String _$addReviewHash() => r'120e0175ab2b7f9254e288d64ab0a81666f8cb19';

abstract class _$AddReview extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
