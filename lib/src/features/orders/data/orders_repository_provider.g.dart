// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ordersRemoteDataSource)
final ordersRemoteDataSourceProvider = OrdersRemoteDataSourceProvider._();

final class OrdersRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          OrdersRemoteDataSource,
          OrdersRemoteDataSource,
          OrdersRemoteDataSource
        >
    with $Provider<OrdersRemoteDataSource> {
  OrdersRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ordersRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ordersRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<OrdersRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OrdersRemoteDataSource create(Ref ref) {
    return ordersRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrdersRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrdersRemoteDataSource>(value),
    );
  }
}

String _$ordersRemoteDataSourceHash() =>
    r'bd851b5a51a67704ad43c39b35fe822a357f0a47';

@ProviderFor(ordersRepository)
final ordersRepositoryProvider = OrdersRepositoryProvider._();

final class OrdersRepositoryProvider
    extends
        $FunctionalProvider<
          OrdersRepository,
          OrdersRepository,
          OrdersRepository
        >
    with $Provider<OrdersRepository> {
  OrdersRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ordersRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ordersRepositoryHash();

  @$internal
  @override
  $ProviderElement<OrdersRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  OrdersRepository create(Ref ref) {
    return ordersRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrdersRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrdersRepository>(value),
    );
  }
}

String _$ordersRepositoryHash() => r'b21a5210650b219c037436d60cc301e14e6d70b1';
