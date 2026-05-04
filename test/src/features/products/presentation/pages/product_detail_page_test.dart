import 'package:ecommerce_app/src/app.dart';
import 'package:ecommerce_app/src/features/cart/data/cart_repository_provider.dart';
import 'package:ecommerce_app/src/features/cart/data/local/app_database.dart';
import 'package:ecommerce_app/src/features/products/presentation/pages/product_detail_page.dart';
import 'package:ecommerce_app/src/theme/app_spacing.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('詳細画面に商品情報が表示される', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: App()));
    await tester.pumpAndSettle();

    await tester.tap(
      find.ancestor(
        of: find.text('ブルスケッタプレート'),
        matching: find.byType(InkWell),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('ブルスケッタプレート'), findsOneWidget);
    expect(
      find.text('イタリア陶器職人による手描きのブルスケッタ柄プレート。食卓を華やかに彩ります。'),
      findsOneWidget,
    );
    expect(find.text('¥2,500'), findsOneWidget);
    expect(find.text('4.5'), findsOneWidget);
    expect(find.text('128 件のレビュー'), findsOneWidget);
  });

  testWidgets('評価なし商品の詳細画面で評価が非表示になる', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            extensions: const [AppSpacing.standard],
          ),
          home: const ProductDetailPage(productId: '2'),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('モッツァレラプレート'), findsOneWidget);
    expect(find.text('0.0'), findsNothing);
    expect(find.text('0 件のレビュー'), findsNothing);
  });

  testWidgets('カートアイコンをタップするとカート画面に遷移する', (tester) async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(database)],
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(
      find.ancestor(
        of: find.text('ブルスケッタプレート'),
        matching: find.byType(InkWell),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.shopping_cart));
    await tester.pumpAndSettle();

    expect(find.text('カート'), findsOneWidget);
    expect(find.text('カートは空です。'), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpAndSettle();
    await database.close();
  });

  testWidgets('詳細画面の数量ステッパーが正しく動作する', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: App()));
    await tester.pumpAndSettle();

    await tester.tap(
      find.ancestor(
        of: find.text('ブルスケッタプレート'),
        matching: find.byType(InkWell),
      ),
    );
    await tester.pumpAndSettle();

    final addButton = find.widgetWithIcon(IconButton, Icons.add);
    final removeButton = find.widgetWithIcon(IconButton, Icons.remove);
    await tester.ensureVisible(addButton);
    await tester.pumpAndSettle();

    expect(tester.widget<IconButton>(removeButton).onPressed, isNull);

    await tester.tap(addButton);
    await tester.pump();
    expect(find.text('2'), findsOneWidget);

    await tester.tap(removeButton);
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
  });
}
