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
}
