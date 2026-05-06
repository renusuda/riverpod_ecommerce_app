import 'package:ecommerce_app/src/features/cart/data/cart_repository_provider.dart';
import 'package:ecommerce_app/src/features/cart/data/local/app_database.dart';
import 'package:ecommerce_app/src/features/payment/presentation/pages/payment_page.dart';
import 'package:ecommerce_app/src/theme/app_spacing.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('カートの商品と合計が表示される', (tester) async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());
    await database
        .into(database.cartEntries)
        .insert(CartEntriesCompanion.insert(productId: '1', quantity: 1));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(database)],
        child: const _PaymentTestApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('支払い'), findsOneWidget);
    expect(find.text('ブルスケッタプレート'), findsOneWidget);
    expect(find.text('¥2,500'), findsOneWidget);
    expect(find.text('数量: 1'), findsOneWidget);
    expect(find.text('合計: ¥2,500'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, '支払う'), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpAndSettle();
    await database.close();
  });

  testWidgets('カートが空の場合は空状態が表示される', (tester) async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(database)],
        child: const _PaymentTestApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('支払い'), findsOneWidget);
    expect(find.text('カートは空です。'), findsOneWidget);
    expect(find.text('ブルスケッタプレート'), findsNothing);
    expect(find.text('合計: ¥2,500'), findsNothing);
    expect(find.widgetWithText(ElevatedButton, '支払う'), findsNothing);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpAndSettle();
    await database.close();
  });
}

class _PaymentTestApp extends StatelessWidget {
  const _PaymentTestApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        extensions: const [AppSpacing.standard],
      ),
      home: const PaymentPage(),
    );
  }
}
