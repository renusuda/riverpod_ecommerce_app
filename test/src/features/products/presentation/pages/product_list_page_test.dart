import 'package:ecommerce_app/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('shows products from test data', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: App()));
    await tester.pumpAndSettle();

    expect(find.text('ブルスケッタプレート'), findsOneWidget);
    expect(find.text('4.5'), findsOneWidget);
    expect(find.text('128 件のレビュー'), findsOneWidget);
    expect(find.text('¥2,500'), findsOneWidget);
    expect(find.text('在庫数: 5'), findsWidgets);
  });

  testWidgets('averageRating が 0 の商品は評価が非表示になる', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: App()));
    await tester.pumpAndSettle();

    final mozzarellaCard = find.ancestor(
      of: find.text('モッツァレラプレート'),
      matching: find.byType(Card),
    );
    expect(
      find.descendant(of: mozzarellaCard, matching: find.text('0.0')),
      findsNothing,
    );
    expect(
      find.descendant(of: mozzarellaCard, matching: find.text('0 件のレビュー')),
      findsNothing,
    );
  });

  testWidgets('検索ワードに一致する商品のみ表示される', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: App()));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), '貯金箱');
    await tester.pumpAndSettle();

    expect(find.text('貯金箱（ブルー）'), findsOneWidget);
    expect(find.text('ブルスケッタプレート'), findsNothing);
  });

  testWidgets('検索ワードをクリアすると全商品が再表示される', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: App()));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), '貯金箱');
    await tester.pumpAndSettle();
    expect(find.text('ブルスケッタプレート'), findsNothing);

    await tester.enterText(find.byType(TextField), '');
    await tester.pumpAndSettle();
    expect(find.text('ブルスケッタプレート'), findsOneWidget);
  });

  testWidgets('検索結果が0件の場合は「商品が見つかりませんでした」が表示される', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: App()));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), '存在しない商品名');
    await tester.pumpAndSettle();

    expect(find.text('商品が見つかりませんでした'), findsOneWidget);
  });

  testWidgets('カートアイコンをタップするとカート画面に遷移する', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: App()));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.shopping_cart));
    await tester.pumpAndSettle();

    expect(find.text('カート'), findsOneWidget);
    expect(find.text('カートは空です。'), findsNothing);
  });
}
