import 'dart:async';

import 'package:ecommerce_app/src/features/cart/data/cart_repository.dart';
import 'package:ecommerce_app/src/features/cart/data/local/app_database.dart';
import 'package:ecommerce_app/src/features/cart/data/local/cache_cart_local_data_source.dart';
import 'package:ecommerce_app/src/features/cart/data/local/cart_local_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_repository_provider.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final database = AppDatabase();
  ref.onDispose(() => unawaited(database.close()));
  return database;
}

@Riverpod(keepAlive: true)
CartLocalDataSource cartLocalDataSource(Ref ref) {
  final database = ref.watch(appDatabaseProvider);
  return CacheCartLocalDataSource(database: database);
}

@Riverpod(keepAlive: true)
CartRepository cartRepository(Ref ref) {
  final localDataSource = ref.watch(cartLocalDataSourceProvider);
  return CartRepository(localDataSource: localDataSource);
}
