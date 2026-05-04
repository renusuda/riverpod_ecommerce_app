import 'package:drift/drift.dart';
import 'package:ecommerce_app/src/features/cart/data/local/app_database.dart';
import 'package:ecommerce_app/src/features/cart/data/local/cart_local_data_source.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart_item.dart';

class CacheCartLocalDataSource implements CartLocalDataSource {
  const CacheCartLocalDataSource({required AppDatabase database})
    : _database = database;

  final AppDatabase _database;

  @override
  Future<Cart> fetchCart() async {
    final entries = await _database.select(_database.cartEntries).get();
    final items = entries
        .map(
          (entry) =>
              CartItem(productId: entry.productId, quantity: entry.quantity),
        )
        .toList(growable: false);

    return Cart(items: items);
  }

  @override
  Future<void> addToCart(String productId, int quantity) async {
    final existing = await (_database.select(
      _database.cartEntries,
    )..where((t) => t.productId.equals(productId))).getSingleOrNull();

    final newQuantity = (existing?.quantity ?? 0) + quantity;

    await _database
        .into(_database.cartEntries)
        .insertOnConflictUpdate(
          CartEntriesCompanion(
            productId: Value(productId),
            quantity: Value(newQuantity),
          ),
        );
  }
}
