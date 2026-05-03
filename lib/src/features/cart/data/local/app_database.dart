import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class CartEntries extends Table {
  TextColumn get productId => text()();

  IntColumn get quantity => integer()();

  @override
  Set<Column> get primaryKey => {productId};
}

@DriftDatabase(tables: [CartEntries])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'ecommerce'));

  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;
}
