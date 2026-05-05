// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SignIn)
final signInProvider = SignInProvider._();

final class SignInProvider extends $AsyncNotifierProvider<SignIn, void> {
  SignInProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signInProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signInHash();

  @$internal
  @override
  SignIn create() => SignIn();
}

String _$signInHash() => r'762c9bb6f58dc991e644211b2e0fafa1ca5056c0';

abstract class _$SignIn extends $AsyncNotifier<void> {
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
