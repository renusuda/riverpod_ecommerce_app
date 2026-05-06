import 'package:drift/native.dart';
import 'package:ecommerce_app/src/features/authentication/data/authentication_repository_provider.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/providers/sign_in_provider.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/providers/sign_up_provider.dart';
import 'package:ecommerce_app/src/features/cart/data/cart_repository_provider.dart';
import 'package:ecommerce_app/src/features/cart/data/local/app_database.dart';
import 'package:ecommerce_app/src/features/cart/data/remote/cart_remote_data_source.dart';
import 'package:ecommerce_app/src/features/cart/data/remote/fake_cart_remote_data_source.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart_item.dart';
import 'package:ecommerce_app/src/features/cart/presentation/providers/cart_provider.dart'
    as cart_provider;
import 'package:ecommerce_app/src/features/cart/presentation/providers/cart_sync_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  test('ログイン成功後にローカルカートをリモートカートへ移行する', () async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());
    final remoteDataSource = FakeCartRemoteDataSource();
    await database
        .into(database.cartEntries)
        .insert(CartEntriesCompanion.insert(productId: '1', quantity: 2));

    final container = ProviderContainer(
      overrides: [
        appDatabaseProvider.overrideWithValue(database),
        cartRemoteDataSourceProvider.overrideWithValue(remoteDataSource),
      ],
    );
    addTearDown(container.dispose);
    addTearDown(database.close);
    final subscription = container.listen(signInProvider, (_, _) {});
    addTearDown(subscription.close);
    final cartSyncSubscription = container.listen(cartSyncProvider, (_, _) {});
    addTearDown(cartSyncSubscription.close);

    await container
        .read(signInProvider.notifier)
        .signIn(email: 'test@test.com', password: 'password');
    await _waitForCartSync();

    final remoteCart = await remoteDataSource.fetchCart('moc.tset@tset');
    final localEntries = await database.select(database.cartEntries).get();

    expect(container.read(signInProvider).hasError, isFalse);
    expect(remoteCart.items, const [CartItem(productId: '1', quantity: 2)]);
    expect(localEntries, isEmpty);
  });

  test('ログイン後のcartProviderはリモートカートを参照する', () async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());
    final remoteDataSource = FakeCartRemoteDataSource();
    await database
        .into(database.cartEntries)
        .insert(CartEntriesCompanion.insert(productId: '3', quantity: 1));

    final container = ProviderContainer(
      overrides: [
        appDatabaseProvider.overrideWithValue(database),
        cartRemoteDataSourceProvider.overrideWithValue(remoteDataSource),
      ],
    );
    addTearDown(container.dispose);
    addTearDown(database.close);
    final signInSubscription = container.listen(signInProvider, (_, _) {});
    addTearDown(signInSubscription.close);
    final cartSyncSubscription = container.listen(cartSyncProvider, (_, _) {});
    addTearDown(cartSyncSubscription.close);
    final cartSubscription = container.listen(
      cart_provider.cartProvider,
      (_, _) {},
    );
    addTearDown(cartSubscription.close);

    await remoteDataSource.saveCart(
      'moc.tset@tset',
      const Cart(items: [CartItem(productId: '1', quantity: 1)]),
    );

    await container
        .read(signInProvider.notifier)
        .signIn(email: 'test@test.com', password: 'password');
    await _waitForCartSync();
    await container.read(cart_provider.cartProvider.notifier).add('1', 1);
    await _waitForCartProvider(container, const [
      CartItem(productId: '1', quantity: 2),
      CartItem(productId: '3', quantity: 1),
    ]);

    final cart = await container.read(cart_provider.cartProvider.future);
    final remoteCart = await remoteDataSource.fetchCart('moc.tset@tset');

    expect(cart.items, const [
      CartItem(productId: '1', quantity: 2),
      CartItem(productId: '3', quantity: 1),
    ]);
    expect(remoteCart.items, cart.items);
  });

  test('カート移行が失敗してもログインは成功扱いにする', () async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());
    await database
        .into(database.cartEntries)
        .insert(CartEntriesCompanion.insert(productId: '1', quantity: 2));

    final container = ProviderContainer(
      overrides: [
        appDatabaseProvider.overrideWithValue(database),
        cartRemoteDataSourceProvider.overrideWithValue(
          _ThrowingCartRemoteDataSource(),
        ),
      ],
    );
    addTearDown(container.dispose);
    addTearDown(database.close);
    final subscription = container.listen(signInProvider, (_, _) {});
    addTearDown(subscription.close);
    final cartSyncSubscription = container.listen(cartSyncProvider, (_, _) {});
    addTearDown(cartSyncSubscription.close);

    await container
        .read(signInProvider.notifier)
        .signIn(email: 'test@test.com', password: 'password');
    await _waitForCartSync();

    final localEntries = await database.select(database.cartEntries).get();

    expect(container.read(signInProvider).hasError, isFalse);
    expect(localEntries, hasLength(1));
  });

  test('新規登録成功後にローカルカートをリモートカートへ移行する', () async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());
    final remoteDataSource = FakeCartRemoteDataSource();
    await database
        .into(database.cartEntries)
        .insert(CartEntriesCompanion.insert(productId: '1', quantity: 2));

    final container = ProviderContainer(
      overrides: [
        appDatabaseProvider.overrideWithValue(database),
        cartRemoteDataSourceProvider.overrideWithValue(remoteDataSource),
      ],
    );
    addTearDown(container.dispose);
    addTearDown(database.close);
    final subscription = container.listen(signUpProvider, (_, _) {});
    addTearDown(subscription.close);
    final cartSyncSubscription = container.listen(cartSyncProvider, (_, _) {});
    addTearDown(cartSyncSubscription.close);

    await container
        .read(signUpProvider.notifier)
        .signUp(email: 'new@test.com', password: 'password');
    await _waitForCartSync();

    final remoteCart = await remoteDataSource.fetchCart('moc.tset@wen');
    final localEntries = await database.select(database.cartEntries).get();

    expect(container.read(signUpProvider).hasError, isFalse);
    expect(remoteCart.items, const [CartItem(productId: '1', quantity: 2)]);
    expect(localEntries, isEmpty);
  });

  test('再ログイン時にもローカルカートをリモートカートへ移行する', () async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());
    final remoteDataSource = FakeCartRemoteDataSource();

    final container = ProviderContainer(
      overrides: [
        appDatabaseProvider.overrideWithValue(database),
        cartRemoteDataSourceProvider.overrideWithValue(remoteDataSource),
      ],
    );
    addTearDown(container.dispose);
    addTearDown(database.close);
    final signInSubscription = container.listen(signInProvider, (_, _) {});
    addTearDown(signInSubscription.close);
    final cartSyncSubscription = container.listen(cartSyncProvider, (_, _) {});
    addTearDown(cartSyncSubscription.close);

    await container
        .read(signInProvider.notifier)
        .signIn(email: 'test@test.com', password: 'password');
    await container.read(authenticationRepositoryProvider).signOut();
    await _waitForCartSync();
    await database
        .into(database.cartEntries)
        .insert(CartEntriesCompanion.insert(productId: '1', quantity: 2));

    await container
        .read(signInProvider.notifier)
        .signIn(email: 'test@test.com', password: 'password');
    await _waitForCartSync();

    final remoteCart = await remoteDataSource.fetchCart('moc.tset@tset');
    final localEntries = await database.select(database.cartEntries).get();

    expect(remoteCart.items, const [CartItem(productId: '1', quantity: 2)]);
    expect(localEntries, isEmpty);
  });
}

Future<void> _waitForCartSync() async {
  await Future<void>.delayed(const Duration(milliseconds: 2500));
}

Future<void> _waitForCartProvider(
  ProviderContainer container,
  List<CartItem> expectedItems,
) async {
  for (var i = 0; i < 20; i++) {
    final items = container
        .read(cart_provider.cartProvider)
        .maybeWhen(data: (cart) => cart.items, orElse: () => null);
    if (items.toString() == expectedItems.toString()) return;
    await Future<void>.delayed(const Duration(milliseconds: 100));
  }
}

class _ThrowingCartRemoteDataSource implements CartRemoteDataSource {
  @override
  Future<void> addToCart(String userId, String productId, int quantity) {
    throw StateError('remote cart failed');
  }

  @override
  Future<Cart> fetchCart(String userId) {
    throw StateError('remote cart failed');
  }

  @override
  Future<void> removeFromCart(String userId, String productId) {
    throw StateError('remote cart failed');
  }

  @override
  Future<void> saveCart(String userId, Cart cart) {
    throw StateError('remote cart failed');
  }

  @override
  Stream<Cart> watchCart(String userId) {
    throw StateError('remote cart failed');
  }
}
