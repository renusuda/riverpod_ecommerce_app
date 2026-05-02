import 'package:ecommerce_app/src/app.dart';
import 'package:ecommerce_app/src/features/products/presentation/pages/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('shows products from test data', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: App()));
    await tester.pumpAndSettle();

    expect(find.text('Bruschetta plate'), findsOneWidget);
    expect(find.text('4.5'), findsOneWidget);
    expect(find.text('128 ratings'), findsOneWidget);
    expect(find.text('\$15.00'), findsOneWidget);
    expect(find.text('Quantity: 5'), findsWidgets);
  });

  testWidgets('averageRating が 0 の商品は評価が非表示になる', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: App()));
    await tester.pumpAndSettle();

    final mozzarellaCard = find.ancestor(
      of: find.text('Mozzarella plate'),
      matching: find.byType(Card),
    );
    expect(
      find.descendant(of: mozzarellaCard, matching: find.text('0.0')),
      findsNothing,
    );
    expect(
      find.descendant(of: mozzarellaCard, matching: find.text('0 ratings')),
      findsNothing,
    );
  });

  testWidgets('製品カードをタップすると詳細画面に遷移する', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: App()));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Bruschetta plate'));
    await tester.pumpAndSettle();

    expect(find.byType(ProductDetailPage), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
  });
}
