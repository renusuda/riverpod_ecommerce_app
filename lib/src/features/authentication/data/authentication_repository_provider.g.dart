// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authenticationRemoteDataSource)
final authenticationRemoteDataSourceProvider =
    AuthenticationRemoteDataSourceProvider._();

final class AuthenticationRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          AuthenticationRemoteDataSource,
          AuthenticationRemoteDataSource,
          AuthenticationRemoteDataSource
        >
    with $Provider<AuthenticationRemoteDataSource> {
  AuthenticationRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authenticationRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authenticationRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<AuthenticationRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AuthenticationRemoteDataSource create(Ref ref) {
    return authenticationRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthenticationRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthenticationRemoteDataSource>(
        value,
      ),
    );
  }
}

String _$authenticationRemoteDataSourceHash() =>
    r'5f36f2162c62cae15bb55938be68c27b067f75db';

@ProviderFor(authenticationRepository)
final authenticationRepositoryProvider = AuthenticationRepositoryProvider._();

final class AuthenticationRepositoryProvider
    extends
        $FunctionalProvider<
          AuthenticationRepository,
          AuthenticationRepository,
          AuthenticationRepository
        >
    with $Provider<AuthenticationRepository> {
  AuthenticationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authenticationRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authenticationRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthenticationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AuthenticationRepository create(Ref ref) {
    return authenticationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthenticationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthenticationRepository>(value),
    );
  }
}

String _$authenticationRepositoryHash() =>
    r'9beaea200ef1d6ba9b47c63290bc4a2d02687757';
