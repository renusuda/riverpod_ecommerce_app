import 'package:drift/native.dart';
import 'package:ecommerce_app/src/features/cart/data/cart_repository.dart';
import 'package:ecommerce_app/src/features/cart/data/local/app_database.dart';
import 'package:ecommerce_app/src/features/cart/data/local/cache_cart_local_data_source.dart';
import 'package:ecommerce_app/src/features/cart/data/remote/fake_cart_remote_data_source.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase database;
  late CacheCartLocalDataSource localDataSource;
  late FakeCartRemoteDataSource remoteDataSource;
  late CartRepository repository;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    localDataSource = CacheCartLocalDataSource(database: database);
    remoteDataSource = FakeCartRemoteDataSource();
    repository = CartRepository(
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );
  });

  tearDown(() async {
    await database.close();
  });

  test('ローカルカートをリモートカートに移行してローカルを空にする', () async {
    await localDataSource.addToCart('1', 2);

    await repository.migrateLocalCartToRemote('user-1');

    final remoteCart = await remoteDataSource.fetchCart('user-1');
    final localCart = await localDataSource.watchCart().first;

    expect(remoteCart.items, const [CartItem(productId: '1', quantity: 2)]);
    expect(localCart.items, isEmpty);
  });

  test('同じ商品は数量を合算する', () async {
    await localDataSource.addToCart('1', 3);
    await remoteDataSource.saveCart(
      'user-1',
      const Cart(items: [CartItem(productId: '1', quantity: 4)]),
    );

    await repository.migrateLocalCartToRemote('user-1');

    final remoteCart = await remoteDataSource.fetchCart('user-1');

    expect(remoteCart.items, const [CartItem(productId: '1', quantity: 7)]);
  });

  test('リモートのみの商品と商品マスタに存在しない商品もそのまま保存する', () async {
    await localDataSource.addToCart('missing', 2);
    await localDataSource.addToCart('2', 1);
    await remoteDataSource.saveCart(
      'user-1',
      const Cart(items: [CartItem(productId: '3', quantity: 1)]),
    );

    await repository.migrateLocalCartToRemote('user-1');

    final remoteCart = await remoteDataSource.fetchCart('user-1');

    expect(remoteCart.items, const [
      CartItem(productId: '3', quantity: 1),
      CartItem(productId: 'missing', quantity: 2),
      CartItem(productId: '2', quantity: 1),
    ]);
  });

  test('ローカルカートが空の場合はリモートカートを変更しない', () async {
    await remoteDataSource.saveCart(
      'user-1',
      const Cart(items: [CartItem(productId: '3', quantity: 1)]),
    );

    await repository.migrateLocalCartToRemote('user-1');

    final remoteCart = await remoteDataSource.fetchCart('user-1');

    expect(remoteCart.items, const [CartItem(productId: '3', quantity: 1)]);
  });
}
